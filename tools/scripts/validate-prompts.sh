#!/bin/bash
# This is V1.0.0 of RSP AI Native SDLC Framework


# validate-prompts.sh
# Validates prompt files follow RSP Framework conventions

set -e

PROMPTS_DIR="${1:-.}"

echo "🔍 Validating prompts in: $PROMPTS_DIR"
echo ""

ERRORS=0
WARNINGS=0

# Check each markdown file
find "$PROMPTS_DIR" -name "*.md" -type f | while read -r file; do
    echo "Checking: $file"

    # Check for required sections
    if ! grep -q "## Context" "$file"; then
        echo "  ❌ Missing '## Context' section"
        ((ERRORS++))
    fi

    if ! grep -q "## Goal" "$file"; then
        echo "  ⚠️  Missing '## Goal' section"
        ((WARNINGS++))
    fi

    if ! grep -q "## Requirements" "$file"; then
        echo "  ⚠️  Missing '## Requirements' section"
        ((WARNINGS++))
    fi

    # Check file naming (YYYY-MM-DD-description.md)
    filename=$(basename "$file")
    if ! echo "$filename" | grep -qE '^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+\.md$|^README\.md$'; then
        echo "  ⚠️  Filename doesn't follow convention (YYYY-MM-DD-description.md)"
        ((WARNINGS++))
    fi

    echo ""
done

echo "================================================"
if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo "✅ All prompts valid!"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo "⚠️  Validation complete with $WARNINGS warning(s)"
    exit 0
else
    echo "❌ Validation failed with $ERRORS error(s) and $WARNINGS warning(s)"
    exit 1
fi
