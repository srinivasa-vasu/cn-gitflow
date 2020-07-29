#!/bin/bash
set -xe

echo "Commit id $(cat git-dev/.git/short_ref)" >> comments/output.txt
cat git-dev/.git/commit_message >> comments/output.txt
echo "Commit by $(cat git-dev/.git/committer)" >> comments/output.txt