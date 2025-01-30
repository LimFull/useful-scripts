#!/bin/bash

git checkout dev
git pull origin dev
git checkout -
git rebase dev

