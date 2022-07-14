#!/bin/sh

#return;
# Modified from: https://gist.github.com/m14t/3056747

REPO_URL=$(git remote -v | grep -m1 '^origin' | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p')

echo "$REPO_URL"
if [ -z "$REPO_URL" ]; then
    echo "-- ERROR:  Could not identify Repo url."
    echo "   It is possible this repo is already using SSH instead of HTTPS."
    exit
fi

USER=$(echo "$REPO_URL" | sed -Ene's#https://.*github.com/([^/]*)/(.*)#\1#p')
if [ -z "$USER" ]; then
    echo "-- ERROR:  Could not identify User."
    exit
fi

REPO=$(echo "$REPO_URL" | sed -Ene's#https://.*github.com/([^/]*)/(.*).git#\2#p')
if [ -z "$REPO" ]; then
    echo "-- ERROR:  Could not identify Repo."
    exit
fi

NEW_URL="git@github.com:$USER/$REPO.git"
echo "Changing repo url from "
echo "  '$REPO_URL'"
echo "      to "
echo "  '$NEW_URL'"
echo ""

CHANGE_CMD="git remote set-url origin $NEW_URL"
eval "$CHANGE_CMD"

echo "Success"