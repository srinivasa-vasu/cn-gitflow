#!/bin/bash

export LOCAL_REPO=$LOCAL_REPO
export REPO_KEY=$REPO_KEY
export REPO_SECRET=$REPO_SECRET

set -xeu

cd git-dev
gradle test