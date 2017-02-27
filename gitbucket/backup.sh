#!/bin/sh
set -e

ROOT_DIR_NAME=backups
SUB_DIR_NAME=`date +%Y%m%d`
FILE_PREFIX=`date +%H%M%S`
IMAGE_BASE_NAME=`basename $(pwd) | tr -d "-"`

echo "[INFO] Start backup."

if [ ! -d ./${ROOT_DIR_NAME}/${SUB_DIR_NAME} ]; then
  mkdir ./${ROOT_DIR_NAME}/${SUB_DIR_NAME}
fi

sudo docker run --volumes-from gb-mysql-storage -v $(pwd)/${ROOT_DIR_NAME}/${SUB_DIR_NAME}/:/${ROOT_DIR_NAME}/${SUB_DIR_NAME}/ \
  ${IMAGE_BASE_NAME}_gb-mysql-storage:latest tar cvf /${ROOT_DIR_NAME}/${SUB_DIR_NAME}/${FILE_PREFIX}_gitbucket_mysql.tar /var/lib/mysql

sudo docker run --volumes-from gitbucket-storage -v $(pwd)/${ROOT_DIR_NAME}/${SUB_DIR_NAME}/:/${ROOT_DIR_NAME}/${SUB_DIR_NAME}/ \
  ${IMAGE_BASE_NAME}_gitbucket-storage:latest tar cvf /${ROOT_DIR_NAME}/${SUB_DIR_NAME}/${FILE_PREFIX}_gitbucket_data.tar /gitbucket
