#!/bin/bash
echo "Script must be run as root!"

GRP_NAME=$1

mkdir -p caches
chgrp $GRP_NAME caches
chmod g+s caches

mkdir -p caches/easy-index
mkdir -p caches/results
mkdir -p caches/m2/repository

rm data -Rf

mkdir data
chgrp $GRP_NAME data
chmod g+s data

# make sure that ownership is inherited (or it will be set to root:root by docker)
mkdir -p data/baseDir
mkdir -p data/progress

# bitnami/kafka runs rootless with user 1001
mkdir -p data/kafka
chown 1001 data/kafka

chmod 770 caches -R
chmod 770 data -R
