#!/bin/sh

GITBUCKET_VERSION="4.35.0"
SHA256_CHECKSUM="931da6b27f473f8df9d4c0fc573665f6565c298f0281e2d2eff7d16f98b7bb71"

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
