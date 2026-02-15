<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Version Control for AI Interactions

## Overview

Version control is essential for reproducible AI-Native development. This guide covers how to version prompts, context, and AI-generated artifacts.

## What to Version

### 1. Prompts
The instructions given to AI assistants

**Why**: Learn what works, iterate on successful patterns

**How**:
- Save prompts as markdown files
- Use descriptive filenames with dates
- Organize by feature or phase

### 2. Context Documents
Background information provided to AI

**Why**: Understand how context affects results

**How**:
- Version project context separately
- Update as project evolves
- Link from prompts

### 3. AI-Generated Code
Code produced by AI assistants

**Why**: Track changes, review history

**How**:
- Standard git commits
- Tag commits involving AI
- Reference prompts in commit messages

### 4. Decision Records
Why certain approaches were chosen

**Why**: Maintain rationale and accountability

**How**:
- Use ADR (Architecture Decision Record) format
- Link to relevant prompts
- Update as decisions evolve

## Directory Structure

```
your-project/
├── prompts/
│   ├── README.md
│   ├── 2024-02-14-user-auth-api.md
│   ├── 2024-02-15-refactor-auth-service.md
│   └── templates/
│       ├── feature-development.md
│       └── bug-fix.md
│
├── decisions/
│   ├── 0001-jwt-authentication.md
│   ├── 0002-database-choice.md
│   └── README.md
│
└── context/
    ├── project-overview.md
    ├── tech-stack.md
    └── conventions.md
```

## Prompt Versioning Strategies

### Strategy 1: Date-Based Naming
`YYYY-MM-DD-brief-description.md`

**Pros**: Chronological, easy to track evolution
**Cons**: Doesn't show relationships

**Example**: `2024-02-14-implement-user-service.md`

### Strategy 2: Feature-Based Naming
`feature-name-iteration.md`

**Pros**: Groups related prompts
**Cons**: Less clear timeline

**Example**: `user-auth-v1.md`, `user-auth-v2.md`

### Strategy 3: Hierarchical Structure
Organize by module/component

**Pros**: Logical organization
**Cons**: More complex structure

```
prompts/
├── auth/
│   ├── login-endpoint.md
│   └── logout-endpoint.md
└── users/
    └── crud-operations.md
```

## Prompt Template Format

```markdown
# [Feature/Task Name]

**Date**: YYYY-MM-DD
**Author**: [Your Name]
**AI Assistant**: [Tool Used]
**Version**: [Version Number]

## Context
[Project background, tech stack, constraints]

## Goal
[What you want to achieve]

## Requirements
[Specific requirements]
- Requirement 1
- Requirement 2

## Constraints
[Limitations or considerations]

## Expected Output
[What you expect as result]

## Prompt
[The actual prompt given to AI]

---

## Results
[Summary of AI response]

## Follow-up
[Next steps or related prompts]
```

## Git Integration

### Commit Message Format

```
feat: Add user authentication endpoint

AI-Generated: Yes
Prompt: prompts/2024-02-14-user-auth-api.md
Reviewed: Yes
Tests: Added
```

### Branch Strategy

**For Exploration**:
```bash
git checkout -b ai/explore-auth-approaches
```

**For Implementation**:
```bash
git checkout -b feature/user-authentication
```

### Tags for Milestones

```bash
git tag -a v1.0-ai-baseline -m "Initial AI-generated implementation"
```

## Context Management

### Project Context Document

```markdown
# Project Context

**Last Updated**: YYYY-MM-DD

## Project Overview
[Brief description]

## Tech Stack
- Backend: Node.js, Express
- Database: PostgreSQL
- Auth: JWT

## Architecture
[High-level architecture]

## Conventions
- Code style: ESLint + Prettier
- Testing: Jest
- Documentation: JSDoc

## Current Focus
[What you're working on]
```

### Updating Context

- Review and update monthly
- Update after major changes
- Version alongside code

## Automation

### Pre-commit Hook

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Check if commit message references prompt when AI tag is used
if git diff --cached --name-only | grep -q "^src/"; then
    if git log -1 --pretty=%B | grep -q "AI-Generated: Yes"; then
        if ! git log -1 --pretty=%B | grep -q "Prompt:"; then
            echo "Error: AI-generated commit must reference prompt file"
            exit 1
        fi
    fi
fi
```

### Prompt Validation Script

```bash
#!/bin/bash
# scripts/validate-prompts.sh

# Check that all prompts follow the template format
for file in prompts/*.md; do
    if ! grep -q "## Context" "$file"; then
        echo "Warning: $file missing Context section"
    fi
done
```

## Best Practices

### DO
✅ Version all significant AI interactions
✅ Use descriptive filenames and commit messages
✅ Link prompts to generated code
✅ Update context regularly
✅ Review and iterate on prompts

### DON'T
❌ Commit prompts without context
❌ Use vague or generic filenames
❌ Version every trivial interaction
❌ Forget to document results
❌ Leave outdated context

## Common Patterns

### Pattern: Iterative Refinement
Version each iteration of a prompt

```
prompts/
├── user-auth-v1-initial.md
├── user-auth-v2-add-validation.md
└── user-auth-v3-final.md
```

### Pattern: Template Reuse
Create reusable prompt templates

```
templates/
├── feature-development.md
├── bug-fix.md
└── refactoring.md
```

### Pattern: Decision Trail
Link prompts to decisions

```markdown
# Decision: JWT Authentication

Referenced Prompts:
- prompts/2024-02-14-evaluate-auth-options.md
- prompts/2024-02-15-implement-jwt.md
```

## Measuring Success

### Metrics
- Prompt reuse rate: % of prompts reused
- Documentation coverage: % of AI code with prompt references
- Time to find relevant prompts: Average search time

### Success Indicators
- Can recreate any past interaction
- New developers can understand prompt history
- Failed prompts can be debugged and improved

## Tools

### Version Control
- **Git**: Standard version control
- **GitHub/GitLab**: Collaboration and review
- **DVC**: Data Version Control for large contexts

### Documentation
- **Markdown**: Lightweight, git-friendly
- **Obsidian**: Knowledge management
- **Notion**: Team collaboration

### Automation
- **Pre-commit**: Git hook framework
- **GitHub Actions**: CI/CD automation
- **Custom scripts**: Project-specific validation

## Next Steps

- Set up prompt directory structure
- Create your first versioned prompt
- Implement [Audit Trails](audit-trails.md)
- Add [Testing](testing.md) validation
