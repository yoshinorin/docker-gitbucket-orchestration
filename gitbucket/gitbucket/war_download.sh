#!/bin/sh

GITBUCKET_VERSION="4.33.0"
SHA256_CHECKSUM="35e190ddb7a2f9760d43617d2e6325c2a745ba66061daa3fa95cc9d871423506"

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
