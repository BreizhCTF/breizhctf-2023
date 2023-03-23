import * as path from 'path';
import * as fs from 'fs';
import * as pulumi from '@pulumi/pulumi';
import * as k8s from '@pulumi/kubernetes';
import { config } from "./config";
import { NamespaceDeployment } from "./components/namespace.component";
import { CtfdComponent } from './components/ctfd.component';
import { ChallengeManagerComponent } from './components/challengeManager.component';
import { CHALLENGES } from './challenges';
import { Utils } from './utils';
import { Namespace } from '@pulumi/kubernetes/core/v1';

// Deploy a full set of challenges in a dedicated namespace
new NamespaceDeployment(config.namespace, CHALLENGES, {
    providers: { kubernetes: Utils.kubeProvider }
});

const dynamicChallengeNs = new Namespace('dynamic-challenge', {
    metadata: {
        name: 'dynamic-challenge'
    }
}, { provider: Utils.kubeProvider });

// Deploy the challenge manager for isolated challenges
new ChallengeManagerComponent('default', {
    challengeNamespace: dynamicChallengeNs.metadata.name
},{
    providers: { kubernetes: Utils.kubeProvider }
});

// Deploy a CTFD only in dev environment
if (pulumi.getStack() === "k3s") {
    new CtfdComponent('default', {
        customImage: 'registry-bzh.alfred.cafe/breizh-ctf-2023/ctfd:latest',
        registryAuth: config.registryAuth,
        providers: { kubernetes: Utils.kubeProvider }
    });
}
