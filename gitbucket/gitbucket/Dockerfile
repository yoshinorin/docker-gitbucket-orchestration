FROM eclipse-temurin:17.0.2_8-jre-focal

RUN mkdir -p /usr/opt/gitbucket

WORKDIR /usr/opt/gitbucket
COPY docker-entrypoint.sh /usr/opt/gitbucket
COPY /war/gitbucket.war /usr/opt/gitbucket

RUN chmod +x /usr/opt/gitbucket/docker-entrypoint.sh \
  && ln -s /gitbucket /root/.gitbucket \
  && apt-get update -y \
  && apt-get install mysql-client -y

ENTRYPOINT "/usr/opt/gitbucket/docker-entrypoint.sh"
