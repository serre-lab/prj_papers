#!/bin/bash
# Check naming conventions (warnings only, always exits 0)
# Warns if repo name doesn't match pattern or if tracked paths contain spaces/uppercase

WARNINGS=0

# Get current directory name
REPO_NAME=$(basename "$(pwd)")

# Check repo name pattern: paper-YYYY-shortslug
if [[ ! "$REPO_NAME" =~ ^paper-[0-9]{4}-[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    echo "⚠ Warning: Repository name '$REPO_NAME' does not match pattern 'paper-YYYY-shortslug'"
    echo "   (This is expected for 'paper-template' and can be ignored.)"
    echo "   Actual paper repos must match: paper-2026-fossil-leaves, paper-2025-hmax-revival, etc."
    ((WARNINGS++))
fi

# Check tracked files for spaces or uppercase
if git rev-parse --git-dir > /dev/null 2>&1; then
    # Git repo: check tracked files
    FILES=$(git ls-files)
else
    # Not a git repo: use find (exclude build/)
    FILES=$(find . -type f -not -path "./build/*" -not -path "./.git/*" | sed 's|^\./||')
fi

if [ -n "$FILES" ]; then
    while IFS= read -r file; do
        # Check for spaces
        if [[ "$file" =~ [[:space:]] ]]; then
            echo "⚠ Warning: Path contains spaces: $file"
            ((WARNINGS++))
        fi
        # Check for uppercase (in path components, not just filename)
        if [[ "$file" =~ [A-Z] ]]; then
            echo "⚠ Warning: Path contains uppercase letters: $file"
            ((WARNINGS++))
        fi
    done <<< "$FILES"
fi

if [ $WARNINGS -eq 0 ]; then
    echo "✓ Naming conventions check passed."
else
    echo "⚠ Found $WARNINGS naming issue(s) (warnings only)."
fi

exit 0

