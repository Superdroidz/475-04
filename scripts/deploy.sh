#!/bin/bash

if [[ $TRAVIS_BRANCH == 'gh-pages' ]] ; then
  cd _site
  git init

  git config user.name "Travis CI"
  git config user.email "nothing152351252135@nothing.com"

  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push -f -q https://Superdroidz:$GITHUB_API_KEY@github.com/Superdroidz/475-04 master:master > /dev/null 2>&1 
else
  echo 'Invalid branch. You can only deploy from gh-pages.'
  exit 1
fi
