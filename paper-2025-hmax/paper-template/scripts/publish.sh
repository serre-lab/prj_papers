#!/bin/bash
# Publish workflow: compile, stage sources, commit, push
# Usage: publish.sh [TEX_FILE] [COMMIT_MSG] [INCLUDE_PDF]
#   TEX_FILE: default main.tex
#   COMMIT_MSG: default "Update paper"
#   INCLUDE_PDF: default 0 (set to 1 to also stage build/main.pdf)

set -e

TEX_FILE="${1:-main.tex}"
COMMIT_MSG="${2:-Update paper}"
INCLUDE_PDF="${3:-0}"

# Always compile first
echo "Compiling..."
./scripts/compile.sh "${TEX_FILE}"

# Check if this is a git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Not a git repository. Compilation successful."
    exit 0
fi

# Stage source files
echo "Staging source files..."
git add *.tex bib/ figures/ fig-src/ style/ scripts/ Makefile README.md .gitignore .cursor/

# Optionally stage PDF
if [ "$INCLUDE_PDF" = "1" ]; then
    PDF_NAME="build/$(basename ${TEX_FILE%.tex}.pdf)"
    if [ -f "$PDF_NAME" ]; then
        git add "$PDF_NAME"
        echo "Also staging: $PDF_NAME"
    fi
fi

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Commit
echo "Committing changes..."
git commit -m "$COMMIT_MSG"

# Check for origin remote
if ! git remote get-url origin > /dev/null 2>&1; then
    echo ""
    echo "No 'origin' remote configured."
    echo "To set up GitHub:"
    echo "  Path A (GitHub CLI): gh repo create <REPO_NAME> --private --source=. --remote=origin --push"
    echo "  Path B (Manual):"
    echo "    1. Create repo on GitHub (no README/license)"
    echo "    2. git remote add origin git@github.com:<USER>/<REPO_NAME>.git"
    echo "    3. git branch -M main"
    echo "    4. git push -u origin main"
    exit 0
fi

# Push to origin
CURRENT_BRANCH=$(git branch --show-current)
echo "Pushing to origin/${CURRENT_BRANCH}..."
git push origin "${CURRENT_BRANCH}"

echo "✓ Published successfully."

