import * as fs from 'fs';
import * as path from 'path';
import * as pulumi from '@pulumi/pulumi';
import { ComponentResource, ComponentResourceOptions, Input, output, Output } from '@pulumi/pulumi';
import * as k8s from '@pulumi/kubernetes';
import { Challenge, IngressPort, NodePort, ServiceType } from '../types/challenge.type';
import { config } from '../config';
import { Utils } from '../utils';


/**
 * This component creates a kubernetes Deployment with one or many containers
 * Additionaly, it create a service with bind to all provided ports
 * It is designed to work with Metal LB which expose an IP accessible from outside the cluster
 */
export class ChallengeComponent extends ComponentResource {

    public name: string;

    /**
     * Kubernetes deployment
     */
    public deployment: k8s.apps.v1.Deployment;

    /**
     * Kubernetes Service
     * A Load balancer loadbalancer
     * Require Metal LB to be configure on the cluster
     */
    public service?: k8s.core.v1.Service;

    public networkPolicy?: k8s.networking.v1.NetworkPolicy;

    /**
     * Load balancer IP
     */
    // public lbIp: Output<string>;

    constructor(
        public challengePath: string,
        public challenge: Challenge,
        opts: ComponentResourceOptions & {
            ipPool: string;
            namespace: string;
            pullSecret?: Output<string>;
        }
    ) {
        super(`pkg::ChallengeDeployment`, path.basename(challengePath), {}, opts);
        this.name = path.basename(challengePath)
            .replace(/[^a-z0-9]/g, '')
            .replace(/[^0-9a-z\-]/g, '-');
        
        const provider = challenge.dynamic ? this.createKubeYamlProvider() : undefined;

        let labels: Record<string, string> = {
            challenge: this.name,
        };
        if (challenge.dynamic) {
            labels = {
                ...labels,
                'isolated-challenge.kube-ctf.downunderctf.com/deployment': "{{ deployment_id }}",
                'isolated-challenge.kube-ctf.downunderctf.com/owner': "{{ owner_id }}"
            };
        }

        let imagePullSecrets: any[];
        if (opts.pullSecret) {
            if (challenge.dynamic) {
                imagePullSecrets = [{
                    name: Utils.getPullSecret('dynamic-challenge')?.metadata.name
                }];
            } else {
                imagePullSecrets = [{
                    name: opts.pullSecret
                }];
            }
        } else {
            imagePullSecrets = [];
        }

        this.deployment = new k8s.apps.v1.Deployment(`${this.name}-deployment`, {
            metadata: {
                name: challenge.dynamic ? `dynamic-{{deployment_id}}` : this.name,
                namespace: opts.namespace,
                labels
            },
            spec: {
                selector: { matchLabels: labels },
                replicas: challenge.dynamic ? 1 : (challenge.replicas ?? config.replicas),
                strategy: challenge.dynamic ? { type: 'Recreate' } : {
                    type: 'RollingUpdate',
                    rollingUpdate: {
                        maxSurge: 1,
                        maxUnavailable: 0
                    }
                },
                
                template: {
                    metadata: { labels },
                    spec: {
                        nodeSelector: {
                            'node': 'true'
                        },
                        imagePullSecrets,
                        enableServiceLinks: false,
                        automountServiceAccountToken: false,
                        topologySpreadConstraints: [{
                            maxSkew: 1,
                            topologyKey: 'server',
                            whenUnsatisfiable: 'DoNotSchedule',
                            nodeTaintsPolicy: 'Honor',
                            labelSelector: {
                                matchLabels: labels
                            }
                        }],
                        containers: challenge.containers.map(container => {
                            const { env, ports } = container;

                            const imageInfo = Utils.fetchImageHash(
                                container.image
                                    ?? path.join(config.registry, Utils.sanityzeImageName(path.basename(challengePath)))
                            );

                            // Defined startupProbe and liveness proble
                            let probe;
                            if (container.ports) { // Determine http or tcp proble depending of the declared port
                                if (container.ports?.map(config => config.port).includes(80)) {
                                    probe = {
                                        httpGet: {
                                            path: '/',
                                            port: 80
                                        },
                                        // initialDelaySeconds: 10, // Wait 10 seconde before starting probe
                                        periodSeconds: 30, // Check every 30 seconds
                                        failureThreshold: 10 // Restart container after 10 tries being unhealthy (5 minutes)
                                    }
                                } else if(container.ports?.length > 0) {
                                    probe = {
                                        tcpSocket: {
                                            port: container.ports[0].port
                                        },
                                        periodSeconds: 30,
                                        failureThreshold: 10
                                    }
                                }
                            }

                            return {
                                image: imageInfo,
                                name: `${this.name}-${container.name ?? 'main'}`,
                                securityContext: {
                                    allowPrivilegeEscalation: false,
                                    runAsNonRoot: false,
                                    seccompProfile: {
                                        type: 'RuntimeDefault'
                                    }
                                },
                                resources: {
                                    requests: {
                                        cpu: "200m",
                                        memory: "200Mi",
                                        'ephemeral-storage': '500Mi',
                                        ...container.requests
                                    },
                                    limits: {
                                        cpu: '4000m',
                                        memory: "2Gi",
                                        'ephemeral-storage': '1Gi',
                                        ...container.limits
                                    }
                                },
                                env: Object.entries(env ?? {}).map(([ name, value ]) => ({ name, value })),
                                ports: ports?.map(({ port }) => ({
                                    containerPort: port
                                })),
                                startupProbe: probe ? {
                                    ...probe,
                                    failureThreshold: 120 / 5,
                                    periodSeconds: 5,
                                } : undefined,
                                livenessProbe: probe,
                                // readinessProbe: {
                                //     ...probe,
                                //     periodSeconds: 5
                                // },
                                ...container.overrides
                            } as k8s.types.input.core.v1.Container;
                        })
                    }
                }
            }
        }, { parent: this, provider });

        // Ingress / Node port
        const ports = challenge.containers
            .flatMap(container => container.ports)
        const ingressPorts = ports.filter((port): port is IngressPort => port?.serviceType === ServiceType.INGRESS_HTTP);
        const nodePorts = ports.filter((port): port is NodePort => port?.serviceType === ServiceType.NODEPORT);

        if (ingressPorts.length > 0) {
            this.service = new k8s.core.v1.Service(`${this.name}-service-ingress`, {
                metadata: {
                    name: challenge.dynamic ? `dynamic-{{deployment_id}}-ingress` : `${this.name}-ingress`,
                    namespace: opts.namespace,
                    labels,
                    annotations: {
                        'traefik.ingress.kubernetes.io/service.sticky.cookie': 'true',
                        'traefik.ingress.kubernetes.io/service.sticky.cookie.name': 'load-balancer-session-ne-pas-supprimer',
                        'traefik.ingress.kubernetes.io/service.sticky.cookie.secure': 'true'
                    }
                },
                spec: {
                    ports: ingressPorts.map(({ port }) => ({
                        name: `${this.name}-${port.toString()}`,
                        port
                    })),
                    selector: labels
                }
            }, { parent: this, dependsOn: this.deployment, provider });

            new k8s.networking.v1.Ingress(`${this.name}-ingress`, {
                metadata: {
                    name: challenge.dynamic ? `dynamic-{{deployment_id}}` : `${this.name}`,
                    namespace: 'main',
                    labels
                },
                spec: {
                    rules: ingressPorts.map(port => ({
                        host: (challenge.dynamic ? '{{deployment_id}}' : `${port.subdomain ?? this.name}`) + '.ctf.bzh',
                        http: {
                            paths: [{
                                pathType: 'Prefix',
                                path: '/',
                                backend: {
                                    service: {
                                        name: this.service!.metadata.name,
                                        port: {
                                            number: port.port
                                        }
                                    }
                                }
                            }]
                        }
                    }))
                }
            }, { parent: this, dependsOn: this.service, provider });
        }
        
        if (nodePorts.length > 0) {
            this.service = new k8s.core.v1.Service(`${this.name}-service-nodeport`, {
                metadata: {
                    name: challenge.dynamic ? `dynamic-{{deployment_id}}` : `${this.name}`,
                    namespace: opts.namespace,
                    labels
                },
                spec: {
                    type: "NodePort",
                    sessionAffinity: "ClientIP",
                    ports: nodePorts.map(({ port, nodePort }) => ({
                        name: `${this.name}-${port.toString()}`,
                        port,
                        nodePort: challenge.dynamic ? undefined : nodePort
                    })),
                    selector: labels
                }
            }, { parent: this, dependsOn: this.deployment, provider });

            this.networkPolicy = new k8s.networking.v1.NetworkPolicy(`${this.name}-network-policy`, {
                metadata: { namespace: opts.namespace },
                spec: {
                    policyTypes: ['Ingress'],
                    podSelector: { matchLabels: labels },
                    ingress: [{
                        ports: nodePorts.map(nodePort => ({ port: nodePort.port }))
                    }]
                }
            }, { parent: this, provider });
        }

        if (challenge.dynamic) {
            const yamlDir = path.join('dynamic-challenges', this.name);

            new k8s.apiextensions.CustomResource(`${this.name}-dynamic`, {
                apiVersion: 'kube-ctf.downunderctf.com/v1',
                kind: 'IsolatedChallenge',
                metadata: {
                    name: this.name
                },
                spec: {
                    expires: 3600,
                    template: this.service?.status.apply(v => {
                        if (pulumi.runtime.isDryRun()) {
                            return undefined;
                        }
                        
                        const content = fs.readdirSync(path.join(yamlDir, '1-manifest'))
                            .map(file => {    
                                console.log(path.join(yamlDir, '1-manifest', file));
                                return fs.readFileSync(path.join(yamlDir, '1-manifest', file));
                            })
                            .join('\n---\n');
                        
                        return content;
                    })
                }
            }, {
                dependsOn: [this.service!, this.deployment],
                parent: this
            });
        }
    }

    private createKubeYamlProvider() {
        return new k8s.Provider('kube-yaml-' + this.name, {
            renderYamlToDirectory: `dynamic-challenges/${this.name}`
        });
    }

}