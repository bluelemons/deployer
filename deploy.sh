#!/bin/bash

set -e

app=muebleria
remote_env=$1
remote_url=$2
tag=$3
token=$4

if [ -d $app ]
then (cd $app && git pull)
else git clone https://github.com/bluelemons/muebleria.git
fi

cat <<NETRC > ~/.netrc
machine api.heroku.com
  login auser
  password $token
NETRC

cd $app
git push --force $remote_url $tag:master
