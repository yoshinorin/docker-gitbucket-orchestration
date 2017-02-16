#!/bin/sh -xe

cat > /gitbucket/database.conf <<-EOCONF
db {
  url = "$MYSQL_URL"
  user = "$MYSQL_USER"
  password = "$MYSQL_PASSWORD"
}
EOCONF

sleep 10

exec java -jar /usr/opt/gitbucket/gitbucket.war