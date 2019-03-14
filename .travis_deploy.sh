#!/bin/sh
set -e

openssl aes-256-cbc -K $encrypted_9d525ff4942a_key -iv $encrypted_9d525ff4942a_iv -in deploy-key.enc -out deploy-key -d
chmod 600 deploy-key
eval `ssh-agent -s`
ssh-add deploy-key

./node_modules/.bin/gh-pages -d _build/ -b gh-pages -r git@github.com:${TRAVIS_REPO_SLUG}.git
