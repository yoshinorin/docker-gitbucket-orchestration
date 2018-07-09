#!/bin/sh

GITBUCKET_VERSION="4.26.0"
SHA256_CHECKSUM="c08bbe7ae7020b87e008ae9fda8b77d2a98f6b558661b03de49dbfd9acc5be42"

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
