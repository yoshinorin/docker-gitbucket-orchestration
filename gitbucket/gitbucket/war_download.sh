#!/bin/sh

GITBUCKET_VERSION="4.13"
SHA256_CHECKSUM="fb61cc1b9fc4ea48fc9edfc3847800d8ed4e2fab0ed74f2b63992bf3c863d2a7"

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