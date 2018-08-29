#!/bin/sh

GITBUCKET_VERSION="4.27.0"
SHA256_CHECKSUM="394e8d6932c37c17ee12b05af2b9072006f97b2db84ff25e6e58fef8379f4b17"

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
