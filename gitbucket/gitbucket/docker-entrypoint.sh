#!/bin/sh
set +e

cat > /gitbucket/database.conf <<-EOCONF
db {
  url = "$MYSQL_URL"
  user = "$MYSQL_USER"
  password = "$MYSQL_PASSWORD"
}
EOCONF

if [ -n "$MYSQL_USER" ]; then
  echo `date '+%Y/%m/%d %H:%M:%S'` $0 "[INFO] Connection confriming..."
  while :
  do
    result=`/usr/bin/mysqladmin ping -h gb-mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD}`
    echo $result;
    if echo $result|grep 'alive'; then
      break
    fi
    sleep 3;
  done
fi

if [ "$LOGGING" = 1 ]; then
  exec java -Dlogback.configurationFile=/gitbucket/config/logback-settings.xml -jar /usr/opt/gitbucket/gitbucket.war
else
  exec java -jar /usr/opt/gitbucket/gitbucket.war
fi