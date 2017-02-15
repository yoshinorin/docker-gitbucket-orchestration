FROM java:9-jre

MAINTAINER YoshinoriN

RUN mkdir -p /usr/libexec/gitbucket

WORKDIR /usr/libexec/gitbucket
COPY docker-entrypoint.sh /usr/libexec/gitbucket
COPY /libexec/gitbucket.war /usr/libexec/gitbucket

ENTRYPOINT "/usr/libexec/gitbucket/docker-entrypoint.sh"
