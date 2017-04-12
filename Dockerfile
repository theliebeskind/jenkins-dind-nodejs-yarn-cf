FROM oviis/jenkins-dind-slave:v2
MAINTAINER Thomas Liebeskind (thomas.liebeskind@gmail.com)

USER root

RUN echo "===> Installing sudo to emulate normal OS behavior and other needed bins..."
RUN apk --update add sudo git curl              
RUN echo "===> Adding NodeJS..." 
RUN apk --update add nodejs
RUN apk --update add yarn
RUN rm -rf /var/cache/apk/*      

USER jenkins
