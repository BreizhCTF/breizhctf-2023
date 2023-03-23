FROM node:18-alpine

WORKDIR /usr/app

COPY . .

RUN apk add bash
RUN npm i
RUN npx hardhat compile

EXPOSE 8545
EXPOSE 3000

USER node

ENTRYPOINT [ "./start.sh" ]
