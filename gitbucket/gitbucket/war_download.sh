#!/bin/sh

GITBUCKET_VERSION="4.22.0"
SHA256_CHECKSUM="9cfee9c5c04a30d0ad19228b2283925ca6d64b3a3a345b8540b9b784ac555d47"

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
