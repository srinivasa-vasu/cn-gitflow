#!/bin/bash

set -xe

cd git-repo
echo "Commit id $(cat git-repo/.git/short_ref)" > comments/output.txt
cat git-repo/.git/commit_message >> comments/output.txt
echo "Commit by $(cat git-repo/.git/committer)" >> comments/output.txt