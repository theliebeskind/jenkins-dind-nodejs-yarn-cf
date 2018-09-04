FROM oviis/jenkins-dind-slave:v2
MAINTAINER Thomas Liebeskind (thomas.liebeskind@gmail.com)

USER root

RUN echo "===> Installing sudo to emulate normal OS behavior and other needed bins..."
RUN apk --update add sudo git make curl musl-dev gcc
RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories
RUN echo "===> Adding NPM..." 
RUN apk --update add "nodejs-npm=8.11.4-r0"
RUN echo "===> Adding NodeJS..." 
RUN apk --update add "nodejs=8.11.4-r0"
RUN echo "===> Adding YARN..." 
RUN apk --update add --no-cache yarn
RUN echo "===> Adding CF-CLI..." 
RUN apk --update add cloudfoundry-cli
RUN rm -rf /var/cache/apk/*      

USER jenkins
