#!/bin/bash

set -xe

export LOCAL_REPO=$LOCAL_REPO
export REPO_KEY=$REPO_KEY
export REPO_SECRET=$REPO_SECRET

cd git-repo
gradle test