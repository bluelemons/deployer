#!/bin/bash

set -e

app=muebleria
remote_env=$1
remote_url=$2
tag=$3

if [ -d $app ]
then (cd $app && git pull)
else git clone https://github.com/bluelemons/muebleria.git
fi

cd $app
git add remote $remote_env $remote_url
git push --force $tag:master
