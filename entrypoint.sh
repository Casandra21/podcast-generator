#!/bin/bash
echo "====================="

# Set git config using action inputs
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Run feed script
python3 /usr/bin/feed.py

# Commit and push any changes
git add -A
git commit -m "Update feed" || echo "No changes to commit"
git push --set-upstream origin main

echo "====================="
