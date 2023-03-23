import { ComponentResource, ComponentResourceOptions } from "@pulumi/pulumi";
import * as k8s from '@pulumi/kubernetes';
import { ChallengeComponent } from "./challenge.component";
import { ChallengeMapping } from "../types/challenge.type";
import { config } from "../config";
import { Utils } from "../utils";

/**
 * Deploy a specific list of challenge to a dedicated kubernetes namespaces
 * More precisely, this component creates :
 * - A kubernetes namespace
 * - A optional kubernetes namespace to store the authentification token to the private registry
 * - A network policy which denies any external traffic comming from others pod
 * - For each challenge, instanciate a {@link ChallengeComponent} to manage challenge
 */
export class NamespaceDeployment extends ComponentResource {

    public challengeDeployments: ChallengeComponent[];
    public dockerRegistrySecret?: k8s.core.v1.Secret;

    public networkPolicy: k8s.networking.v1.NetworkPolicy;

    constructor(
        public namespace: string,
        public challenges: ChallengeMapping,
        opts: ComponentResourceOptions
    ) {
        super("pkg::namespaceDeployment", 'namespaceDeployment', {}, opts);

        let ns: k8s.core.v1.Namespace | undefined;
        if (config.namespace !== 'default') {
            ns = new k8s.core.v1.Namespace('ns', {
                metadata: {
                    name: namespace,
                    labels: {
                        name: namespace
                    }
                }
            }, { parent: this });
        }

        let secret: string | undefined;
        if (config.registryAuth) {
            secret = 'docker-registry-secret';
            this.dockerRegistrySecret = new k8s.core.v1.Secret('docker-registry-secret', {
                metadata: {
                    name : 'docker-registry-secret',
                    namespace: namespace
                },
                type: "kubernetes.io/dockerconfigjson",
                data: config.registryAuth.apply(auth => ({
                    ".dockerconfigjson": Buffer.from(JSON.stringify({
                        auths: {
                            [config.registry.split('/')[0]]: {
                                auth
                            }
                        }
                    })).toString('base64')
                }))
            }, { parent: this });
        }

        this.networkPolicy = new k8s.networking.v1.NetworkPolicy('allow-traefik-to-pods', {
            metadata: {
                namespace
            },
            spec: {
                // Deny traffic to all pods in this namespace
                podSelector: {},
                ingress: [{
                    from: [{
                        namespaceSelector: {
                            matchLabels: {
                                'kubernetes.io/metadata.name': 'kube-system'
                            }
                        },
                        podSelector: {
                            matchLabels: {
                                'app.kubernetes.io/name': 'traefik'
                            }
                        }
                    }]
                }],
                policyTypes: ['Ingress']
            }
        }, { parent: this, dependsOn: ns ?? [] });

        new k8s.networking.v1.NetworkPolicy('allow-egress-internet', {
            metadata: {
                namespace
            },
            spec: {
                // Deny traffic to all pods in this namespace
                podSelector: {},
                egress: [{
                    to: [
                        {
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
                        },
                        {
                            ipBlock: {
                                cidr: '0.0.0.0/0',
                                except: [
                                    '10.0.0.0/8',
                                    '192.168.0.0/16',
                                    '172.16.0.0/20'
                                ]
                            }
                        }
                    ]
                }],
                policyTypes: ['Egress']
            }
        }, { parent: this, dependsOn: ns ?? [] });


        // let docker: DockerProvider;
        // if (config.registryAuth) {
        //     const credentials = config.registryAuth.apply(token => Buffer.from(token, 'base64').toString().split(':'));
            
        //     docker = new DockerProvider(`docker-${namespace}`, {
        //         registryAuth: [{
        //             address: config.registry.split('/')[0],
        //             username: credentials[0],
        //             password: credentials[1]
        //         }]
        //     }, { parent: this });
        // }

        const pullSecret = Utils.getPullSecret(namespace)?.metadata.name;

        this.challengeDeployments = Object.entries(challenges)
            .map(([ path, challenge ]) => new ChallengeComponent(path, challenge, {
                ipPool: `${namespace}-pool`,
                namespace,
                parent: this,
                pullSecret,
                dependsOn: ns
            }));
    }
}
