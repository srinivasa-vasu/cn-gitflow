#!/bin/bash

set -xe

cf api $API --skip-ssl-validation

cf login -u $USER -p $PASSWORD -o "$ORG" -s "$SPACE"

cf apps

cf routes

export DOMAIN_NAME=$APP_DOMAIN
export ROUTE_HOSTNAME=$APP_SUFFIX

# flip the app names as the previous task had already deployed the new one
export APP_NAME=$(cat ./app-info/current-app.txt)-$APP_SUFFIX

export CURRENT_APP_NAME=$(cat ./app-info/next-app.txt)-$APP_SUFFIX

echo "Mapping main app route to point to $APP_NAME instance"
cf map-route $APP_NAME $DOMAIN_NAME -n $ROUTE_HOSTNAME

cf routes

set +e
if [ $(cat ./app-info/current-app.txt) -ne $(cat ./app-info/next-app.txt) ]
then
    echo "Removing previous main app route that pointed to $CURRENT_APP_NAME instance"
    cf unmap-route $CURRENT_APP_NAME $DOMAIN_NAME -n $ROUTE_HOSTNAME
fi
set -e

echo "Routes updated"

cf routes