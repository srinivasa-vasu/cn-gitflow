#!/bin/bash

set -xe

cd git-repo
echo "Commit id $(cat git-repo/.git/short_ref)" >> comment/output.txt
cat git-repo/.git/commit_message >> comment/output.txt
echo "Commit by $(cat git-repo/.git/committer)" >> comment/output.txt