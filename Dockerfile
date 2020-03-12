FROM registry.access.redhat.com/ubi8

RUN yum install -y nodejs

WORKDIR /opt/app-root/src

COPY package.json /opt/app-root/src
RUN npm install --only=prod
COPY server /opt/app-root/src/server
COPY public /opt/app-root/src/public

ENV NODE_ENV production
ENV PORT 3000

EXPOSE 3000

CMD ["npm", "start"]
