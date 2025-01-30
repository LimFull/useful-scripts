#!/bin/zsh

git add *
git commit -m"임시 커밋"
git reset --soft Head~2
git commit -m"$(git log --format=%B --reverse Head..Head@{2})"
