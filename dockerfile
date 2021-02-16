FROM node:10-alpine
RUN mkdir -p  /home/node/site/node_modules && chown -R node:node /home/node/site
WORKDIR /home/node/site
COPY package*.json ./
RUN npm config set registry http://registry.npmjs.org/
RUN npm install
COPY --chown=node:node . .
USER node
EXPOSE 8080
CMD [ "node", "index.html" ]