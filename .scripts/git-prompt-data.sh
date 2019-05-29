#!/usr/bin/sh

# number of staged files
staged=$(git diff --cached --stat | awk '{print $1}' | tail -1)

# number of untracked files
untracked=$(git ls-files --others --exclude-standard | wc -l)

# number of commits ahead of origin/master
commits=$(git log origin/master..HEAD --pretty=oneline | wc -l)
