#!/bin/sh

GITBUCKET_VERSION="4.17.0"
SHA256_CHECKSUM="83f65c9ec1534392b5a87c99d833eb36299644d6838a6434685a431a5ac7a727"

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