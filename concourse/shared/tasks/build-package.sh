#!/bin/bash

export LOCAL_REPO=$LOCAL_REPO
export REPO_KEY=$REPO_KEY
export REPO_SECRET=$REPO_SECRET

set -xe

#Get the version number from the file passed in as a env var named 'version'
version=`cat $version`

cd git-dev

gradle build -x test

#mvn clean verify deploy -Ddistribution.management.release.id=artifactory-local -Ddistribution.management.release.url=http://jfrog.humourmind.com:8081/artifactory/libs-release-local

cp build/libs/*.jar ../artifacts/spring-music-$version.jar