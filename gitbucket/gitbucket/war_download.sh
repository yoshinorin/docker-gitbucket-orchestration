#!/bin/sh

GITBUCKET_VERSION="4.37.2"
SHA256_CHECKSUM="b6245065c504a6bd2135a76d0fb0e2495d9d2b4221879491b0bafb960df02cdc"

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
