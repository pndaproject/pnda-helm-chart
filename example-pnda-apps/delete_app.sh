#!/bin/bash


if [ $# -ne 1 ]
  then
    echo "Usage: delete_app.sh tgz_filename"
    exit 0
fi

PACKAGE_REPOSITORY_IP=$(kubectl get service --all-namespaces |grep package-repository | awk '{print $4}')

curl -XDELETE http://$PACKAGE_REPOSITORY_IP:8888/packages/$1?user.name=pnda

