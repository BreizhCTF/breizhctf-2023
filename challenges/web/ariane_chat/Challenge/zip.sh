#!/usr/bin/env bash

set -xe

dir=$PWD

cd ../Docker/back

folder=$(mktemp -d)
mkdir ${folder}/back

cp -r .vscode src .editorconfig .eslintrc.js .prettierrc .yarnrc.yml nest-cli.json package.json tsconfig.build.json tsconfig.json yarn.lock ${folder}/back
mkdir ${folder}/back/.yarn
cp -r .yarn/plugins .yarn/sdks ${folder}/back/.yarn

cd $folder

sed -i 's/BZHCTF{DontPutUserInputIntoYourKeys}/BZHCTF{}'/g back/src/chat/chat.gateway.ts

zip -r ${dir}/back.zip back
