#! /bin/bash

[[ -z $1 ]] && echo "No project was specified!" && exit 1

cd $1
git branch -r |
grep -v "\->" |
xargs -I {} bash -c 'echo -n "$(echo {} | sed -r "s;^origin/;;"): " ;
        git rev-list --count {}'
