#!/bin/sh

GITBUCKET_VERSION="4.23.0"
SHA256_CHECKSUM="559993eaa0a1287f33a08075c438d891e0702a69564f62566d529d7d47a3c6ad"

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
