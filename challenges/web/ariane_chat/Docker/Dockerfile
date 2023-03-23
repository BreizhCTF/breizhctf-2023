FROM node:19-alpine as front-builder

COPY ./front /front
WORKDIR /front
RUN yarn set version stable && yarn && yarn build

FROM node:19-alpine as back-builder

COPY ./back /back
WORKDIR /back
RUN yarn set version stable && yarn && yarn build


FROM node:19-alpine

COPY --from=back-builder /back/dist/ /app/back/dist
COPY --from=back-builder /back/.yarn/  /app/back/.yarn
COPY --from=back-builder /back/yarn.lock /back/package.json /app/back/
WORKDIR /app/back
RUN ls -lah
RUN yarn set version stable && \
    yarn plugin import workspace-tools && \
    yarn workspaces focus --production

COPY --from=front-builder /front/dist /app/front


ENTRYPOINT [ "yarn", "start:prod" ]
