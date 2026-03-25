#!/bin/bash
# Create GitHub repository using GitHub CLI or print manual instructions
# Usage: create_github_repo.sh

REPO_NAME=$(basename "$(pwd)")

# Check if gh CLI is available and authenticated
if command -v gh > /dev/null 2>&1; then
    if gh auth status > /dev/null 2>&1; then
        echo "Creating private GitHub repository: ${REPO_NAME}..."
        gh repo create "${REPO_NAME}" --private --source=. --remote=origin --push
        echo "✓ Repository created and pushed."
        exit 0
    fi
fi

# Fallback: print manual instructions
echo "GitHub CLI not available or not authenticated."
echo ""
echo "Manual setup (Path B):"
echo "1. Create a new private repository on GitHub (no README, no license)"
echo "2. Run these commands:"
echo ""
echo "   git remote add origin git@github.com:<USER>/${REPO_NAME}.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "Or use GitHub CLI (Path A):"
echo "   gh repo create ${REPO_NAME} --private --source=. --remote=origin --push"

exit 0

