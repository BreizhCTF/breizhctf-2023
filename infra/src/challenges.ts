import { join } from 'path';
import { ChallengeMapping, ServiceType } from './types/challenge.type';
import { config } from './config';

export const CHALLENGES: ChallengeMapping = {
    "_exemple/_exemple_flask": {
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP,
                subdomain: 'exemple-flask'
            }]
        }]
    },
    "_exemple/_exemple_http": {
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP,
                subdomain: 'exemple-http'
            }]
        }]
    },
    "_exemple/_exemple_tcp": {
        dynamic: true,
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30001
            }]
        }]
    },
    
    // Blockchain
    "blockchain/breizh_blockchain": {
        dynamic: true,
        containers: [
            { name: 'blockchain' },
            {
                name: 'nginx',
                image: join(config.registry, 'breizh_blockchain-nginx'),
                ports: [{
                    port: 80,
                    serviceType: ServiceType.INGRESS_HTTP
                }]
            }
        ]
    },

    // Cryptographie
    "cryptographie/biscuiterie": {
        dynamic: true,
        containers: [{
            ports: [{
                port: 22,
                serviceType: ServiceType.NODEPORT,
                nodePort: 0
            }],
            overrides: {
                securityContext: {
                    allowPrivilegeEscalation: true,
                    runAsNonRoot: false,
                    seccompProfile: {
                        type: 'RuntimeDefault'
                    }
                }
            }
        }]
    },
    "cryptographie/maintenance": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30011
            }]
        }]
    },
    "cryptographie/ca_tourne": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30012
            }]
        }]
    },
    "cryptographie/quelle_courbe": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30013
            }]
        }]
    },

    // Pentest
    "pentest/dofus": {
        dynamic: true,
        containers: [
            {
                name: 'dofuscms'
            },
            {
                name: 'sslh',
                image: join(config.registry, 'sslh'),
                ports: [{
                    port: 1337,
                    serviceType: ServiceType.NODEPORT,
                    nodePort: 0
                }],
                overrides: {
                    args: ['--listen=0.0.0.0:1337', '--openvpn=127.0.0.1:1194', '--http=127.0.0.1:30000']
                }
            },
            {
                name: 'openvpn',
                image: join(config.registry, 'dofus-openvpn'),
                overrides: {
                    securityContext: {
                        capabilities: {
                            add: ['NET_ADMIN']
                        }
                    }
                }
            }
        ]
    },
    "pentest/huitres_cancales": {
        dynamic: true,
        containers: [
            {
                name: 'main',
                overrides: {
                    securityContext: {
                        allowPrivilegeEscalation: true,
                        runAsNonRoot: false,
                        seccompProfile: {
                            type: 'RuntimeDefault'
                        }
                    },
                },
            },
            {
                name: 'sslh',
                image: join(config.registry, 'sslh'),
                ports: [{
                    port: 1193,
                    serviceType: ServiceType.NODEPORT,
                    nodePort: 0
                }],
                overrides: {
                    args: ['--listen=0.0.0.0:1193', '--openvpn=127.0.0.1:1194', '--http=127.0.0.1:30000']
                },
            },
            {
                name: 'openvpn',
                image: join(config.registry, 'dofus-openvpn'),
                overrides: {
                    securityContext: {
                        capabilities: {
                            add: ['NET_ADMIN']
                        }
                    }
                }
            }
        ]
    },

    // Programmation
    "programmation/mastermind": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30020
            }]
        }]
    },
    "programmation/one_liner": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30022
            }]
        }]
    },

    // Reverse
    "reverse/breizh_os": {
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP
            }]
        }]
    },
    "reverse/cap_ou_stone": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30024
            }]
        }]
    },

    // PWN
    "pwn/demineur": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30021
            }]
        }]
    },
    "pwn/breizh_shop": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30023
            }]
        }]
    },
    "pwn/i_wanna_pwn_you_tonight": {
        containers: [
            {
                name: 'arch32',
                image: join(config.registry, 'i_wanna_pwn_you_tonight-arch32'),
                ports: [{
                    port: 1338,
                    serviceType: ServiceType.NODEPORT,
                    nodePort: 30025
                }]
            },
            {
                name: 'arch64',
                image: join(config.registry, 'i_wanna_pwn_you_tonight-arch64'),
                ports: [{
                    port: 1337,
                    serviceType: ServiceType.NODEPORT,
                    nodePort: 30026
                }]
            }
        ]
    },
    "pwn/breizhjack": {
        dynamic: true,
        containers: [{
            overrides: {
                securityContext: {
                    allowPrivilegeEscalation: true,
                    seccompProfile: {
                        type: 'Unconfined'
                    }
                },
            },
            ports: [{
                port: 22,
                serviceType: ServiceType.NODEPORT,
                nodePort: 0
            }]
        }]
    },
    "pwn/nanomachines": {
        containers: [{
            ports: [{
                port: 1337,
                serviceType: ServiceType.NODEPORT,
                nodePort: 30027
            }]
        }]
    },

    // Web
    "web/behcrypte": {
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP
            }]
        }]
    },
    "web/art_gallery": {
        containers: [
            {
                
                name: 'web',
                overrides: {
                    securityContext: {
                        allowPrivilegeEscalation: false,
                        seccompProfile: {
                            type: 'RuntimeDefault'
                        }
                    },
                },
                env: {
                    TYPO3_DB_DRIVER: "mysqli",
                    TYPO3_DB_USERNAME: "user",
                    TYPO3_DB_PASSWORD: "Q9F6ZgE1rn8B3fSS",
                    TYPO3_DB_HOST: "127.0.0.1",
                    TYPO3_DB_PORT: "3306",
                TYPO3_DB_NAME: "artgallery",
                    TYPO3_SETUP_ADMIN_EMAIL: "sacha@artgallery.tld",
                    TYPO3_SETUP_ADMIN_USERNAME: "sacha",
                    TYPO3_SETUP_PASSWORD: "1a9viGex77ffXb69",
                    TYPO3_PROJECT_NAME: "Art Gallery",
                    TYPO3_CREATE_SITE: "https://art-gallery.ctf.bzh/"
                },
                ports: [{
                    port: 80,
                    serviceType: ServiceType.INGRESS_HTTP,
                    subdomain: 'art-gallery'
                }],
                limits: {
                    'ephemeral-storage': '1Gi'
                }
            },
            {
                image: 'mariadb',
                name: 'db',
                env: {
                    MYSQL_ROOT_PASSWORD: "34kCUSRRGF1VdgPa",
                    MYSQL_USER: "user",
                    MYSQL_PASSWORD: "Q9F6ZgE1rn8B3fSS",
                    MYSQL_DATABASE: "artgallery"
                },
                requests: {
                    memory: '1Gi'
                }
            }
        ]
    },
    "web/bruzz": {
        containers: [
            {
                ports: [{
                    port: 80,
                    serviceType: ServiceType.INGRESS_HTTP
                }],
                name: 'flask',
                env: {
                    "MYSQL_USER": "dbuser",
                    "MYSQL_HOST": "127.0.0.1",
                    "MYSQL_PASSWORD": "userpass",
                    "MYSQL_DATABASE": "bruzz",
                    "SECRET_KEY": "70c27b35abf011bd1f3d5bdfc69ea3cd7e135a4cddf3b75974a22b885e0fc238"
                }
            },
            {
                image: join(config.registry, 'bruzz-mysql'),
                name: 'db',
                env: {
                    "MYSQL_ROOT_PASSWORD": "rootpass",
                    "MYSQL_USER": "dbuser",
                    "MYSQL_PASSWORD": "userpass",
                    "MYSQL_DATABASE": "bruzz",
                },
                requests: {
                    memory: '600Mi'
                }
            }
        ]
    },
    "web/bonjour_ondine": {
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP,
                subdomain: 'ondine'
            }]
        }]
    },
    "web/jwthe": {
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP
            }]
        }]
    },
    "web/alienzh": {
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP
            }]
        }]
    },
    "web/ariane_chat": {
        dynamic: true,
        containers: [{
            ports: [{
                port: 80,
                serviceType: ServiceType.INGRESS_HTTP
            }]
        }]
    }
};
