#!/bin/sh

GITBUCKET_VERSION="4.18.0"
SHA256_CHECKSUM="471e33b67567b8c53faac88b3d148de73ad4d96452cbb5ad4983ee3e975e19dd"

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