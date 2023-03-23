import { Config } from "@pulumi/pulumi";

export const pulumiConfig = new Config();

export const config = {
    /**
     * Kubeconfig configuration file path
     */
    kubeconfig: pulumiConfig.get('kubeconfig') ?? 'kubeconfig.yaml',

    /**
     * Namespace to deploy all containers
     * This namespace will be created by pulumi
     */
    namespace: pulumiConfig.get('namespace') ?? 'default',

    /**
     * Default number of replicas
     * Can be override per challenge
     */
    replicas: pulumiConfig.getNumber('replicas') ?? 1,

    /**
     * Registry base path where all docker images are stored
     * Ex: registry-bzh.alfred.cafe/breizhctf-2023
     */
    registry: pulumiConfig.require('registry'),

    /**
     * Base64 encoded registry credentials
     * pulumi config set --secret registryAuth $(echo -n username:password | base64)
     */
    registryAuth: pulumiConfig.requireSecret('registryAuth'),

    /**
     * Docker image for the challenge manager
     */
    challengeManagerImage: pulumiConfig.require('challengeManagerImage'),

    /**
     * Challenge manager shared secret
     * This value must match the one configured in CTFd
     */
    challengeManagerSecret: pulumiConfig.requireSecret('challengeManagerSecret')
};