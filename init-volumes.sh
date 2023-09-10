#!/bin/bash

echo "Script must be run as root!"

mkdir -p caches/easy-index
chgrp users caches
chmod g+s caches

rm volumes -Rf

mkdir volumes
chgrp users volumes
chmod g+s volumes

# bitnami/kafka runs rootless with user 1001
mkdir -p volumes/kafka
chown 1001 volumes/kafka

# make sure that ownership is inherited (or it will be set to root:root by docker)
mkdir -p volumes/metadata-db/data
mkdir -p volumes/maven-crawler
mkdir -p volumes/easy-index

chmod 770 volumes -R

