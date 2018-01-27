#!/bin/sh

GITBUCKET_VERSION="4.21.2"
SHA256_CHECKSUM="a61ec6d3e5557bf7fd8f2b8830704fcb1f662b61b45d6c4d4778b1ff44acc7da"

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