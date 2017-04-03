#!/bin/sh

GITBUCKET_VERSION="4.11"
SHA256_CHECKSUM="e53b5e8b7c0e3657eb94173d2ec25950fa24c1f5dbbc9c41be060a994d34380e"

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