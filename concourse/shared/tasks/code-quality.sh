#!/bin/bash
set -xe

cd git-repo
gradle build -x test
