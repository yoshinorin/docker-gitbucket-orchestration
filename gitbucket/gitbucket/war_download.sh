#!/bin/sh

GITBUCKET_VERSION="4.14"
SHA256_CHECKSUM="8700d7b45a70f93afe7da7005b284cf8d0455dc8ca852b423d91bb9466e61ee4"

echo "[INFO] warfile downloading..."

cd $(dirname $0)
echo pwd

wget https://github.com/gitbucket/gitbucket/releases/download/${GITBUCKET_VERSION}/gitbucket.war

line=`sha256sum gitbucket.war`
set -f
set -- $line

if [ $SHA256_CHECKSUM = $1 ];then
  mv -f gitbucket.war ./war/
else
  echo "[WARN] Doesn't match the check sum."
fi

echo "[INFO] Finish."