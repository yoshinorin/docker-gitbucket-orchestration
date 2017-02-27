#!/bin/sh

GITBUCKET_VERSION="4.10"
SHA256_CHECKSUM="d8ff3c5f202f921ec49ba45c26e9c98cbfe0096d2729c495d503a636100dc1a3"

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