#!/bin/sh

cat > /usr/libexec/gitbucket/database.conf <<-EOCONF
db {
  url = "$MYSQL_URL"
  user = "$MYSQL_USER"
  password = "$MYSQL_PASSWORD"
}
EOCONF

exec java -jar /usr/libexec/gitbucket/gitbucket.war 