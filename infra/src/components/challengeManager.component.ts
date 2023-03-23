import { ComponentResource, ComponentResourceOptions, Input, Output } from '@pulumi/pulumi';
import { Service, ServiceAccount } from '@pulumi/kubernetes/core/v1';
import { Deployment } from '@pulumi/kubernetes/apps/v1';
import { ClusterRole, ClusterRoleBinding, Role, RoleBinding } from '@pulumi/kubernetes/rbac/v1';
import { config } from '../config';
import { Utils } from '../utils';
import { NetworkPolicy } from '@pulumi/kubernetes/networking/v1';

export class ChallengeManagerComponent extends ComponentResource {

    private pullSecret?: Output<string>;

    public challengeManagerDeployment: Deployment;

    public challengeManagerService: Service;

    constructor(
        public namespace: string,
        private inputs: {
            challengeNamespace: Input<string>;
        },
        opts: ComponentResourceOptions
    ){
        super("pkg::challenge-manager", 'challenge-manager', inputs, opts);

        // Prepare namespace to host dynamic challenges
        (this.inputs.challengeNamespace as Output<string>).apply(ns => Utils.getPullSecret(ns));
        new NetworkPolicy('deny-all', {
            metadata: {
                namespace: this.inputs.challengeNamespace
            },
            spec: {
                podSelector: {},
                ingress: [{}],
                policyTypes: ['Egress']
            }
        }, { parent: this });

        new NetworkPolicy('dynamic-allow-egress-internet', {
            metadata: {
                namespace: this.inputs.challengeNamespace
            },
            spec: {
                // Deny traffic to all pods in this namespace
                podSelector: {},
                egress: [
                    {
                        ports: [
                            { port: 53, protocol: 'TCP' },
                            { port: 53, protocol: 'UDP' }
                        ],
                        to: [{
                            namespaceSelector: {
                                matchLabels: {
                                    'kubernetes.io/metadata.name': 'kube-system'
                                }
                            },
                            podSelector: {
                                matchLabels: {
                                    'k8s-app': 'kube-dns'
                                }
                            }
                        }]
                    },
                    {
                        to: [{
                            ipBlock: {
                                cidr: '0.0.0.0/0',
                                except: [
                                    '10.0.0.0/8',
                                    '192.168.0.0/16',
                                    '172.16.0.0/20'
                                ]
                            }
                        }]
                    }
                ],
                policyTypes: ['Egress']
            }
        }, { parent: this });


        // Challenge manager deployment

        this.pullSecret = Utils.getPullSecret(namespace)?.metadata.name;

        const sa = new ServiceAccount('challenge-manager-sa', {
            metadata: {
                name: 'challenge-manager',
                namespace: this.namespace
            }
        }, { parent: this });

        const role = new Role('challenge-manager-role', {
            metadata: {
                name: 'challenge-manager',
                namespace: this.inputs.challengeNamespace
            },
            rules: [{
                apiGroups: ['*'],
                resources: ['ingresses', 'deployments', 'services', 'pods', 'networkpolicies'],
                verbs: ['create', 'delete', 'get', 'list', 'patch', 'update', 'watch'],
            }]
        }, { parent: this });

        const clusterRole = new ClusterRole('challenge-manager-cluster-role', {
            metadata: {
                name: 'challenge-manager',
                namespace: this.namespace
            },
            rules: [{
                apiGroups: ['kube-ctf.downunderctf.com'],
                resources: ['isolated-challenges'],
                verbs: ['get', 'list']
            }]
        }, { parent: this });

        new RoleBinding('challenge-manager-rb', {
            metadata: {
                name: 'challenge-manager-read-config',
                namespace: this.inputs.challengeNamespace
            },
            roleRef: {
                kind: 'Role',
                name: role.metadata.name,
                apiGroup: 'rbac.authorization.k8s.io'
            },
            subjects: [{
                kind: 'ServiceAccount',
                name: sa.metadata.name,
                namespace: this.namespace
            }]
        }, { parent: this });

        new ClusterRoleBinding('challenge-manager-cluster-rb', {
            metadata: {
                name: 'challenge-manager'
            },
            roleRef: {
                kind: 'ClusterRole',
                name: clusterRole.metadata.name,
                apiGroup: 'rbac.authorization.k8s.io'
            },
            subjects: [{
                kind: 'ServiceAccount',
                name: sa.metadata.name,
                namespace: this.namespace
            }]
        }, { parent: this });

        const labels = { app: 'challenge-manager' };
        this.challengeManagerDeployment = new Deployment('challenge-manager-deployment', {
            metadata: {
                name: 'challenge-manager',
                namespace: this.namespace
            },
            spec: {
                replicas: 1,
                selector: { matchLabels: labels },
                
                template: {
                    metadata: { labels },
                    spec: {
                        containers: [{
                            image: Utils.fetchImageHash(config.challengeManagerImage),
                            name: 'challenge-manager',
                            env: [
                                {
                                    name: 'KUBECTF_BASE_DOMAIN',
                                    value: 'ctf.bzh'
                                },
                                {
                                    name: 'KUBECTF_NAMESPACE',
                                    value: this.inputs.challengeNamespace
                                },
                                {
                                    name: 'KUBECTF_MAX_OWNER_DEPLOYMENTS',
                                    value: '1'
                                },
                                {
                                    name: 'KUBECTF_AUTH_SECRET',
                                    value: config.challengeManagerSecret
                                }
                            ],
                            ports: [{
                                containerPort: 3000
                            }]
                        }],
                        serviceAccountName: sa.metadata.name,
                        imagePullSecrets: this.pullSecret?.apply(name => [{ name }]),
                    },
                }
            }
        }, { parent: this });

        this.challengeManagerService = new Service('challenge-manager-service', {
            metadata: {
                name: 'challenge-manager',
                namespace: this.namespace,
            },
            spec: {
                type: 'NodePort',
                ports: [{
                    port: 3000,
                    targetPort: 3000,
                    nodePort: 30001,
                    protocol: 'TCP'
                }],
                selector: {
                    app: this.challengeManagerDeployment.spec.selector.matchLabels.apply(labels => labels.app)
                }
            }
        }, { parent: this });
    }

}