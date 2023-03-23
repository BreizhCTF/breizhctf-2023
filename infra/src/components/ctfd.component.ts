import { ComponentResource, ComponentResourceOptions, Output } from '@pulumi/pulumi';
import { PersistentVolumeClaim, Secret, Service } from '@pulumi/kubernetes/core/v1';
import { Deployment } from '@pulumi/kubernetes/apps/v1';
import { RandomId, RandomPassword } from '@pulumi/random';
import { Ingress } from '@pulumi/kubernetes/networking/v1';
import { Utils } from '../utils';


export class CtfdComponent extends ComponentResource {

    

    // Secrets generation

    private mysqlPasswd = new RandomPassword('mysql-passwd', {
        length: 16,
        special: false
    }, { parent: this, protect: false });

    private redisPasswd = new RandomPassword('redis-secret', {
        length: 16,
        special: false
    }, { parent: this });

    private ctfdSecret = new RandomId('ctfd-secret', {
        byteLength: 64
    }, { parent: this });

    // Kube secret declaration

    private kubeMysqlSecret: Secret;

    private kubeRedisSecret: Secret;

    private kubeCtfdSecret: Secret;

    // MySQL deployment and service

    private mysqlPVC: PersistentVolumeClaim;
    
    public mysqlDeployment: Deployment;

    public mysqlService: Service;

    // Redis deployment and service

    public redisDeployment: Deployment;

    public redisService: Service;

    // CTFD deployment and service

    private ctfdPVC: PersistentVolumeClaim;

    private pullSecret?: Output<string>;
    
    public ctfdDeployment: Deployment;

    public ctfdService: Service;

    public ingress: Ingress;

    constructor(
        public namespace: string,
        private opts: ComponentResourceOptions & {
            // ipAddressPool: Output<string> | string;
            registryAuth?: Output<string>;
            customImage?: string;
        }
    ){
        super("pkg::ctfd", 'ctfd', {}, opts);

        this.pullSecret = this.opts.registryAuth ? (new Secret('docker-registry-secret-ctfd', {
            metadata: {
                name : 'docker-registry-secret-ctfd',
                namespace: this.namespace
            },
            type: "kubernetes.io/dockerconfigjson",
            data: this.opts.registryAuth.apply(auth => ({
                ".dockerconfigjson": Buffer.from(JSON.stringify({
                    auths: {
                        [this.opts.customImage!.split('/')[0]]: {
                            auth
                        }
                    }
                })).toString('base64')
            }))
        }, { parent: this })).metadata.name : undefined;

        this.kubeMysqlSecret = new Secret('kube-mysql-secret', {
            metadata: {
                name: 'ctfd-mysql',
                namespace: this.namespace
            },
            stringData: this.mysqlPasswd.result.apply(password => ({
                password,
                DATABASE_URL: `mysql+pymysql://ctfd:${password}@ctfd-mysql/ctfd`
            }))
        }, { parent: this });

        this.kubeRedisSecret = new Secret('kube-redis-secret', {
            metadata: {
                name: 'ctfd-redis',
                namespace: this.namespace
            },
            stringData: this.redisPasswd.result.apply(password => ({
                password,
                REDIS_URL: `redis://:${password}@ctfd-redis:6379`
            }))
        }, { parent: this });

        this.kubeCtfdSecret = new Secret('kube-secret-secret', {
            metadata: {
                name: 'ctfd-secret',
                namespace: this.namespace
            },
            stringData: this.ctfdSecret.b64Std.apply(secret_key => ({
                secret_key
            }))
        }, { parent: this });

        // Mysql

        this.mysqlPVC = new PersistentVolumeClaim('mysql-pvc', {
            metadata: {
                name: 'mysql',
                namespace: this.namespace,
            },
            spec: {
                storageClassName: 'longhorn',
                accessModes: [
                    'ReadWriteOnce'
                ],
                resources: {
                    requests: {
                        storage: '2Gi'
                    }
                }
            }
        }, {
            parent: this,
            protect: false
        });

        this.mysqlDeployment = new Deployment('mysql-deployment', {
            metadata: {
                namespace: this.namespace,
                name: 'ctfd-mysql'
            },
            spec: {
                replicas: 1,
                strategy: {
                    type: 'Recreate'
                },
                selector: {
                    matchLabels: {
                        app: 'ctfd-mysql'
                    }
                },
                template: {
                    metadata: {
                        labels: {
                            app: "ctfd-mysql"
                        }
                    },
                    spec: {
                        automountServiceAccountToken: false,
                        containers: [{
                            image: 'mariadb:10.4.12',
                            name: 'ctfd-mysql',
                            args: ["--character-set-server=utf8mb4", "--collation-server=utf8mb4_general_ci"],
    
                            env: [
                                {
                                    name: 'MYSQL_DATABASE',
                                    value: 'ctfd'
                                },
                                {
                                    name: "MYSQL_RANDOM_ROOT_PASSWORD",
                                    value: "yes"
                                },
                                {
                                    name: "MYSQL_USER",
                                    value: "ctfd"
                                },
                                {
                                    name: "MYSQL_PASSWORD",
                                    valueFrom: {
                                        secretKeyRef: {
                                            name: this.kubeMysqlSecret.metadata.name,
                                            key: "password"
                                        }
                                    }
                                }
                            ],
                            volumeMounts: [{
                                name: 'mysql-data',
                                mountPath: '/var/lib/mysql'
                            }],
    
                            ports: [{
                                containerPort: 3306
                            }],
    
                            resources: {
                                requests: {
                                    memory: "2G"
                                }
                            },
    
                            livenessProbe: {
                                initialDelaySeconds: 30,
                                tcpSocket: {
                                    port: 3306
                                },
                                timeoutSeconds: 1
                            }
                        }],
                        volumes: [{
                            name: 'mysql-data',
                            persistentVolumeClaim: {
                                claimName: this.mysqlPVC.metadata.name
                            }
                        }]
                    },
                }
            }
        }, { parent: this });

        this.mysqlService = new Service('mysql-service', {
            metadata: {
                name: 'ctfd-mysql',
                namespace: this.namespace,
            },
            spec: {
                ports: [{
                    port: 3306,
                    targetPort: 3306,
                    protocol: 'TCP'
                }],
                selector: {
                    app: this.mysqlDeployment.spec.selector.matchLabels.apply(labels => labels.app)
                }
            }
        }, { parent: this });

        this.redisDeployment = new Deployment('ctfd-redis-deployment', {
            metadata: {
                name: "ctfd-redis",
                namespace: this.namespace,
                labels: {
                    app: "ctfd-redis"
                }
            },
            spec: {
                replicas: 1,
        
                selector: {
                    matchLabels: {
                        app: "ctfd-redis"
                    }
                },
                template: {
                    metadata: {
                        labels: {
                            app: "ctfd-redis"
                        }
                    },
                    spec: {
                        automountServiceAccountToken: false,
                        containers: [{
                            image: "redis:3.2",
                            name: "ctfd-redis",
                            args: [ "--requirepass", "$(REDIS_PASSWORD)"],
        
                            env: [{
                                name: "REDIS_PASSWORD",
                                valueFrom: {
                                    secretKeyRef: {
                                        name: this.kubeRedisSecret.metadata.name,
                                        key: "password"
                                    }
                                }
                            }],
        
                            ports: [{
                                containerPort: 6379,
                                protocol: "TCP"
                            }],
        
                            resources: {
                                limits: {
                                    memory: "256Mi"
                                }
                            }
                        }]
                    }
                }
            }
        }, { parent: this });

        this.redisService = new Service('redis-service', {
            metadata: {
                name: 'ctfd-redis',
                namespace: this.namespace
            },
            spec: {
                ports: [{
                    port: 6379,
                    targetPort: 6379
                }],
                selector: {
                    app: this.redisDeployment.spec.selector.matchLabels.apply(labels => labels.app)
                }
            }
        }, { parent: this });

        this.ctfdPVC = new PersistentVolumeClaim('ctfd-pvc', {
            metadata: {
                name: 'ctfd-assets',
                namespace: this.namespace
            },
            spec: {
                storageClassName: 'longhorn',
                accessModes: [
                    'ReadWriteMany'
                ],
                resources: {
                    requests: {
                        storage: '2Gi'
                    }
                }
            }
        }, {
            parent: this,
            protect: false
        });

        this.ctfdDeployment = new Deployment('ctfd-deployment', {
            metadata: {
                name: "ctfd",
                namespace: this.namespace
            },
            spec: {
                selector: {
                    matchLabels: {
                        app: "ctfd"
                    }
                },
                
                replicas: 4,
                template: {
                    metadata: {
                        labels: {
                            app: "ctfd"
                        }
                    },
                    spec: {
                        automountServiceAccountToken: false,
                        containers: [{
                            image: Utils.fetchImageHash(this.opts.customImage ?? 'ctfd/ctfd'),
                            name: "ctfd",
                            env: [
                                {
                                    name: "DATABASE_URL",
                                    valueFrom: {
                                        secretKeyRef: {
                                            name: this.kubeMysqlSecret.metadata.name,
                                            key: "DATABASE_URL"
                                        }
                                    }
                                },
                                {
                                    name: "REDIS_URL",
                                    valueFrom: {
                                        secretKeyRef: {
                                            name: this.kubeRedisSecret.metadata.name,
                                            key: "REDIS_URL"
                                        }
                                    }
                                },
                                {
                                    name: 'UPLOAD_FOLDER',
                                    value: '/var/uploads'
                                },
                                {
                                    name: 'REVERSE_PROXY',
                                    value: '2,2,2,2,2'
                                },
                            ],
                            ports: [{
                                containerPort: 8000
                            }],
                            volumeMounts: [
                                {
                                    name: "secret-key",
                                    mountPath: "/opt/CTFd/.ctfd_secret_key",
                                    subPath: "secret_key"
                                },
                                {
                                    name: 'assets',
                                    mountPath: '/var/uploads'
                                }
                            ],
        
                            resources: {
                                requests: {
                                    cpu: "1",
                                    memory: "256Mi"
                                },
                                limits: {
                                    memory: "512Mi"
                                }
                            },
        
                            startupProbe: {
                                httpGet: {
                                    path: "/healthcheck",
                                    port: 8000
                                },
                                initialDelaySeconds: 3,
                                periodSeconds: 3
                            }
                        }],
        
                        imagePullSecrets: this.pullSecret?.apply(name => [{ name }]),
        
                        volumes: [
                            {
                                name: "secret-key",
                                secret: {
                                    secretName: this.kubeCtfdSecret.metadata.name,
                                }
                            },
                            {
                                name: 'assets',
                                persistentVolumeClaim: {
                                    claimName: this.ctfdPVC.metadata.name
                                }
                            }
                        ]
                    }
                }
            }
        }, { parent: this });

        this.ctfdService = new Service('ctfd', {
            metadata: {
                name: 'ctfd',
                namespace: this.namespace,
                // annotations: {
                //     "metallb.universe.tf/address-pool": this.opts?.ipAddressPool
                // }
            },
            spec: {
                // type: 'LoadBalancer',
                // type: 'NodePort',
                // loadBalancerIP: '192.168.9.252',
                selector: {
                    app: this.ctfdDeployment.spec.selector.matchLabels.apply(labels => labels.app)
                },
                ports: [{
                    name: 'ctfd',
                    port: 8000,
                    // targetPort: 8000,
                    // nodePort: 30000
                }]
            }
        }, { parent: this, dependsOn: [this.mysqlService] });

        this.ingress = new Ingress(`ctfd-ingress`, {
            metadata: {
                name: 'ctfd',
                namespace,
                annotations: {
                    'traefik.ingress.kubernetes.io/router.entrypoints': 'web'
                }
            },
            spec: {
                rules: [{
                    host: `www.ctf.bzh`,
                    http: {
                        paths: [{
                            pathType: 'Prefix',
                            path: '/',
                            backend: {
                                service: {
                                    name: this.ctfdService.metadata.name,
                                    port: {
                                        number: 8000
                                    }
                                }
                            }
                        }]
                    }
                }]
            }
        }, { parent: this, dependsOn: this.ctfdService});
    }

}
