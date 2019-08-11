#!/bin/sh

GITBUCKET_VERSION="4.32.0"
SHA256_CHECKSUM="7150e46d20a2a6febfaca53fb2ca796f8729e109d538daa8182dcc42522efee2"

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
