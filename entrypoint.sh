#!/bin/sh

REF=$1
if [ -z $1 ]; then
    REF='master'
fi

REMOTE_REPO="https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
cd "${GITHUB_WORKSPACE}" || exit 1
rm -rf .git
git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -m 'Auto Pushed From Action'
git push --force $REMOTE_REPO master:$REF
