#!/bin/sh

GITBUCKET_VERSION="4.12"
SHA256_CHECKSUM="230b8e87625c19aec3137eaaf40ee73f45b588044d4c4d355ee291dd7ddcddd2"

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