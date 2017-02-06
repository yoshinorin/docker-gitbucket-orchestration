#!/bin/sh

GITBUCKET_VERSION="4.9"
SHA256_CHECKSUM="386f7e1436ef5f2736c8b9a70c668f4552046175f367e1b51693c66f51230445"

echo "[INFO] warfile downloading..."

cd $(dirname $0)
echo pwd

wget https://github.com/gitbucket/gitbucket/releases/download/${GITBUCKET_VERSION}/gitbucket.war

line=`sha256sum gitbucket.war`
set -f
set -- $line

if [ $SHA256_CHECKSUM = $1 ];then
  mv -f gitbucket.war ./libexec/
else
  echo "[WARN] Doesn't match the check sum."
fi

echo "[INFO] Finish."