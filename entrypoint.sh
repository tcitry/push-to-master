#!/bin/sh

REF=$1
if [ -z $1 ]; then
    REF='master'
fi

if [[ -z "${TOKEN}" ]]; then
  TOKEN=${GITHUB_TOKEN}
fi

REMOTE_REPO="https://${TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
cd "${GITHUB_WORKSPACE}" || exit 1
git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -m 'Auto Pushed From Action'
git push --force $REMOTE_REPO master:$REF
