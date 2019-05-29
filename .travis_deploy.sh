#!/bin/sh
set -e #Exit with nonzero exit code if anything fails

openssl aes-256-cbc -K $encrypted_9d525ff4942a_key -iv $encrypted_9d525ff4942a_iv -in deploy-key.enc -out deploy-key -d
chmod 600 deploy-key
eval `ssh-agent -s`
ssh-add deploy-key

echo "Deploying to github pages..."
./node_modules/.bin/gh-pages -d _site/ -b gh-pages -r git@github.com:${TRAVIS_REPO_SLUG}.git
echo "Done"

#echo "Deploying to oer website..."
#python oer_upload.py
#echo "Done"


