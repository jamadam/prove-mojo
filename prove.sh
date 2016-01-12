#!/bin/bash

if [ ! -d mojo ]; then
    git clone https://github.com/kraih/mojo.git
fi

cd mojo
git checkout master
git pull origin master
cd ..

repos=(
"https://github.com/jamadam/Marquee.git"
"https://github.com/jamadam/Mojolicious-Plugin-FormValidatorLazy.git"
"https://github.com/jamadam/Mojolicious-Plugin-PlackMiddleware.git"
"https://github.com/jamadam/WWW-Crawler-Mojo.git"
)

for repo in ${repos[@]}
do
    if [ ! -d module ]; then
        git clone $repo module
    fi

    cd module
    git checkout master
    git pull origin master
    prove -lr -I../mojo/lib t
    cd ..
    rm -rf module
done
