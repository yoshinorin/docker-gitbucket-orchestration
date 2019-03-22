#!/bin/sh

GITBUCKET_VERSION="4.31.1"
SHA256_CHECKSUM="37bd054e8fe5f1e72a40e252f2e8182d319da76574403edcbe345c43d6eccc44"

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
