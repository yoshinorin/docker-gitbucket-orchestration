#!/bin/sh

GITBUCKET_VERSION="4.29.0"
SHA256_CHECKSUM="e9e5c896134874ac1c64581e8d21bba72ae2f41c0f9c6a24aa4f478f58881acc"

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
