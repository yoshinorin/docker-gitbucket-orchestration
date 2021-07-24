#!/bin/sh

GITBUCKET_VERSION="4.36.1"
SHA256_CHECKSUM="e836955d504ab5b347c29e76f46218b3d2390fee53b834d54c11f4c67c8558f5"

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
