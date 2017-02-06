#!/bin/sh

cat <<EOF /gitbucket/database.conf >
db {
  url = "$MYSQL_URL"
  user = "$MYSQL_USER"
  password = "$MYSQL_PASSWORD"
}
EOF

exec java -jar /opt/gitbucket.war 