#!/bin/sh
set -e #Exit with nonzero exit code if anything fails

make install && make book && make site

#zip _site for oer upload
cd _site
zip -r ../oer.zip assets content images units index.html intro.html motivation.html search.html
cd ..

#switch urls in jekyll _config for github deploy
sed -i '27,28s/^/#/' _config.yml
sed -i '31,32s/#//' _config.yml

make book && make site

