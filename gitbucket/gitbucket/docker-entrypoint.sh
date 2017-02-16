#!/bin/sh

cat > /usr/opt/gitbucket/database.conf <<-EOCONF
db {
  url = "$MYSQL_URL"
  user = "$MYSQL_USER"
  password = "$MYSQL_PASSWORD"
}
EOCONF

exec java -jar /usr/opt/gitbucket/gitbucket.war 