FROM java:9-jre

MAINTAINER YoshinoriN

RUN mkdir -p /usr/opt/gitbucket

WORKDIR /usr/opt/gitbucket
COPY docker-entrypoint.sh /usr/opt/gitbucket
COPY /war/gitbucket.war /usr/opt/gitbucket

RUN chmod +x /usr/opt/gitbucket/docker-entrypoint.sh \
  && ln -s /gitbucket /root/.gitbucket

ENTRYPOINT "/usr/opt/gitbucket/docker-entrypoint.sh"
