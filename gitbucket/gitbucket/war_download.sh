#!/bin/sh

GITBUCKET_VERSION="4.15.0"
SHA256_CHECKSUM="ebb41ade9c2b0f6d8ecd5139f81aaad4236d1ca4f05ac11585046c3dc733905a"

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