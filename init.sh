#!/bin/bash
git clone https://github.com/membery/engine
ls -la
cd engine
sed '7a\	fetch = +refs/pull/*/head:refs/remotes/origin/pr/*' .git/config > .git/configNew
rm .git/config
mv .git/configNew .git/config
git fetch
git checkout pr/50
git status
cd ..
git clone https://github.com/MaxKarel/data-demo
cd engine
ln -s ../data-demo data
ls -la
./tools/build.sh
./tests/tools/travis.sh
