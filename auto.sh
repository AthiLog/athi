#!/bin/bash


bundle exec jekyll build

git add .
git commit -m "commit"
git push origin lecture

cd _site
git add .
git commit -m "commit"
git push origin master