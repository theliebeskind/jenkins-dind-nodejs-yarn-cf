FROM jenkins/jnlp-slave:alpine

USER root

RUN echo "===> Installing sudo to emulate normal OS behavior and other needed bins..."
RUN apk --no-cache add sudo git curl gcc
RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories
RUN apk update && apk upgrade nghttp2-libs 
RUN echo "===> Adding NodeJS..." 
RUN apk --no-cache add nodejs-current nodejs-npm
RUN echo "===> Adding YARN..." 
RUN apk --no-cache add --no-cache yarn
RUN echo "===> Adding CF-CLI..." 
RUN apk --no-cache add cloudfoundry-cli
RUN rm -rf /var/cache/apk/*      

USER jenkins

RUN node -v
RUN npm -v
RUN yarn -v

WORKDIR ${HOME}