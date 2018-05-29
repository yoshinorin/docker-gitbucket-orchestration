#!/bin/sh

GITBUCKET_VERSION="4.25.0"
SHA256_CHECKSUM="9f4758bd476cba8648e6f9245c38302e55da53ffe8abd7a84ed88c0be202d6f4"

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
