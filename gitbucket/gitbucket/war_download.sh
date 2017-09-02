#!/bin/sh

GITBUCKET_VERSION="4.16.0"
SHA256_CHECKSUM="6346be85e50ee6e8fbfcac671208999cdf1ab65f9c9a337dfb4673e5018783a8"

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