import type { Output } from "@pulumi/pulumi";

export enum ServiceType {
    INGRESS_HTTP = 'INGRESS_HTTP',
    NODEPORT = 'NODEPORT'
}

export type IngressPort = {
    port: number;
    serviceType: ServiceType.INGRESS_HTTP;
    subdomain?: string; 
};

export type NodePort = {
    port: number;
    serviceType: ServiceType.NODEPORT;
    nodePort: number;
};

export type Challenge = {
    dynamic?: boolean;
    replicas?: number;
    containers: Array<Partial<{
        /**
         * Optional name for the container
         * Required if you declare multiple container on the same pod
         */
        name: string;

        /**
         * Optional container image name
         * Defaults to the challenge name
         * It should be set if you have a non-standard image name
         */
        image: string;

        /**
         * List of ports exposed by the container
         * Each declared port will be accessible by the user
         */
        ports: Array<IngressPort | NodePort>;

        /**
         * Optional object for declaring environment variables
         */
        env: { [key: string]: Output<string> | string };

        requests: Partial<{
            cpu: string;
            memory: string;
            'ephemeral-storage': string;
        }>,

        limits: Partial<{
            cpu: string;
            memory: string;
            'ephemeral-storage': string;
        }>,

        overrides: any;
    }>>
};

export type ChallengeMapping = { [path: string]: Challenge };
