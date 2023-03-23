import { URL } from 'url';
import { readFileSync } from 'fs';
import { join, dirname } from 'path';
import { Provider as DockerProvider, getRegistryImage } from '@pulumi/docker';
import { Provider as KubernetesProvider } from '@pulumi/kubernetes';
import { Secret } from '@pulumi/kubernetesx';
import { config } from './config';

export class Utils {
    
    // Docker
    private static _dockerProvider: DockerProvider;

    private static get dockerProvider() {
        if (!this._dockerProvider) {
            this._dockerProvider = new DockerProvider('docker', {
                registryAuth: config.registryAuth.apply(token => {
                    const [username, password] = Buffer.from(token, 'base64').toString().split(':');

                    return [{
                        address: this.registryHostname,
                        username,
                        password
                    }]
                })
            });
        }
        return this._dockerProvider;
    }

    // Kubernetes
    private static _kubeProvider: KubernetesProvider;
    public static get kubeProvider() {
        if (!this._kubeProvider) {
            this._kubeProvider = new KubernetesProvider('default', {
                kubeconfig: readFileSync(join(dirname(__dirname), config.kubeconfig)).toString()
            });
        }

        return this._kubeProvider;
    }

    /**
     * Map each namespace name to its docker pull secret
     */
    private static pullSecrets = new Map<string, Secret>();

    /**
     * Get host (hostname+port) from the configured docker registry
     */
    private static get registryHostname() {
        return new URL('https://' + config.registry).host;
    }

    /**
     * Sanityze docker image name according to documentation
     */
    static sanityzeImageName(imageName: string) {
        return imageName
            .replace(/[^a-zA-Z0-9_/-]/g, '_')
            .replace(/^[_.-]*/g, '');
    }

    /**
     * Request registry to get exact hash of the provided image name
     * @returns Exact image name with format "<image_name>@sha256:<hash>"
     */
    static async fetchImageHash(imageName: string) {
        const info = await getRegistryImage(
            { name: imageName },
            { provider: this.dockerProvider }
        );

        return `${info.name}@${info.sha256Digest}`;
    }

    /**
     * Checks if a pull secret already exists in the provided namespace
     * then returns the appropriate pullsecret if required
     */
    static getPullSecret(namespace: string): Secret | undefined {
        if (!config.registryAuth) { return; }
        
        if (!this.pullSecrets.has(namespace)) {
            this.pullSecrets.set(namespace, new Secret(`${namespace}-registry-secret`, {
                metadata: { namespace },
                type: 'kubernetes.io/dockerconfigjson',
                data: config.registryAuth.apply(auth => ({
                    ".dockerconfigjson": Buffer.from(JSON.stringify({
                        auths: {
                            [this.registryHostname]: {
                                auth
                            }
                        }
                    })).toString('base64')
                }))
            }, { provider: this.kubeProvider }));
        }
        
        return this.pullSecrets.get(namespace)!;
    }
}