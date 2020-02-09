#!/bin/bash

set -xe

cf api $API --skip-ssl-validation

cf login -u $USER -p $PASSWORD -o "$ORG" -s "$SPACE"

cf apps

set +e
cf apps | grep "$APP_SUFFIX" | grep green
if [ $? -eq 0 ]
then
  echo "green" > ./app-info/current-app.txt
  echo "blue" > ./app-info/next-app.txt
else
  cf apps | grep "$APP_SUFFIX" | grep blue
  if [ $? -eq 0 ]
  then
    echo "blue" > ./app-info/current-app.txt
    echo "green" > ./app-info/next-app.txt
  else
    echo "blue" > ./app-info/current-app.txt
    echo "blue" > ./app-info/next-app.txt
  fi
fi
set -xe

echo "Current main app routes to app instance $(cat ./app-info/current-app.txt)"
echo "New version of app to be deployed to instance $(cat ./app-info/next-app.txt)"