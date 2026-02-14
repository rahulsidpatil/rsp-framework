# Tooling Ecosystem

## Overview

RSP Framework is tool-agnostic, working with any AI assistant and development environment. This guide helps you choose and integrate tools effectively.

## Core Philosophy

### Tool Agnostic
- Framework principles apply to any AI tool
- No vendor lock-in
- Choose tools that fit your context
- Switch tools without losing practices

### Integration Over Replacement
- Works with existing tools
- Complements current workflows
- Incremental adoption
- Minimal disruption

## Tool Categories

### 1. AI Coding Assistants
### 2. Version Control
### 3. Development Environments
### 4. Testing and Validation
### 5. Documentation
### 6. Automation

---

## AI Coding Assistants

### Claude Code / Claude

**Strengths**:
- Excellent context understanding
- Strong at complex reasoning
- Good at following structured prompts
- Supports large context windows

**Best For**:
- Complex feature development
- Architecture discussions
- Code refactoring
- Documentation generation

**RSP Integration**:
- Use CLAUDE.md for project context
- Structured prompting works excellently
- Can handle comprehensive workflows
- Good for team collaboration

---

### GitHub Copilot

**Strengths**:
- IDE integration
- Real-time suggestions
- Large training dataset
- Fast completions

**Best For**:
- Code completion
- Boilerplate generation
- Quick suggestions
- Common patterns

**RSP Integration**:
- Use for implementation phase
- Combine with structured design from other tools
- Version control for significant generations
- Testing still critical

---

### Cursor

**Strengths**:
- IDE with AI built-in
- Multi-file editing
- Codebase understanding
- Chat interface

**Best For**:
- Full development workflow
- Codebase-aware changes
- Iterative development
- Real-time collaboration

**RSP Integration**:
- Natural fit for RSP workflows
- Use composer for structured prompts
- Version control integration
- Team adoption

---

### Codeium

**Strengths**:
- Fast autocomplete
- Free tier available
- Multiple IDE support
- Privacy focused

**Best For**:
- Code completion
- Small teams/individuals
- Privacy-sensitive projects
- Cost-conscious adoption

**RSP Integration**:
- Use for tactical completions
- Combine with strategic planning
- Basic workflow support

---

### Tabnine

**Strengths**:
- On-premise deployment option
- Team learning
- Security focused
- Enterprise features

**Best For**:
- Regulated industries
- Enterprise environments
- On-premise requirements
- Team-specific models

**RSP Integration**:
- Enterprise adoption scenarios
- Security-conscious workflows
- Custom model training

---

## Version Control

### Git

**Essential Tool**: Core to RSP Framework

**RSP Usage**:
```bash
# Version prompts
git add prompts/
git commit -m "Add user auth prompt template"

# Tag AI-generated code
git commit -m "feat: Add auth endpoints

AI-Generated: Yes
Prompt: prompts/2024-02-14-auth-api.md
Reviewed: Yes
Tests: Added"

# Branch strategy
git checkout -b ai/explore-auth-approaches
git checkout -b feature/user-authentication
```

**Best Practices**:
- Separate prompts/ directory
- Clear commit messages
- Reference prompts
- Tag AI involvement

---

### GitHub / GitLab / Bitbucket

**Platform Features**:
- Pull request reviews
- Code comments
- CI/CD integration
- Issue tracking

**RSP Integration**:
- Review AI-generated code in PRs
- Link prompts in PR descriptions
- Automated validation via CI/CD
- Track AI-related issues

---

## Development Environments

### VS Code

**Extensions**:
- AI assistants (Copilot, Codeium, etc.)
- Git integration
- Testing frameworks
- Markdown preview

**RSP Setup**:
```
project/
├── .vscode/
│   ├── settings.json
│   └── tasks.json
├── prompts/
└── decisions/
```

---

### JetBrains IDEs

**Features**:
- AI Assistant plugin
- Strong refactoring tools
- Built-in testing
- Code quality tools

**RSP Integration**:
- Similar to VS Code
- Use built-in VCS features
- Leverage refactoring for AI code review

---

### Vim / Neovim

**Plugins**:
- Copilot.vim
- AI integrations
- Git plugins

**RSP Approach**:
- CLI-based workflows
- Script-based automation
- Git-centric versioning

---

## Testing and Validation

### Unit Testing Frameworks

**JavaScript/TypeScript**:
- Jest, Vitest, Mocha

**Python**:
- pytest, unittest

**Go**:
- go test

**RSP Practice**:
- AI generates tests
- Human reviews coverage
- Add missing edge cases
- Validate test quality

---

### Linters and Formatters

**JavaScript/TypeScript**:
```json
// .eslintrc.json
{
  "rules": {
    "no-console": "warn",
    // Ensure AI follows style
  }
}
```

**Python**:
```ini
# .flake8
[flake8]
max-line-length = 100
```

**RSP Integration**:
- Run on AI-generated code
- Pre-commit hooks
- CI/CD validation
- Auto-fix where safe

---

### Security Scanning

**Tools**:
- npm audit / yarn audit
- Snyk
- Dependabot
- Bandit (Python)
- gosec (Go)

**RSP Practice**:
```yaml
# .github/workflows/security.yml
- name: Security Scan
  run: npm audit

- name: Snyk Test
  run: snyk test
```

---

### Code Quality Tools

**SonarQube / SonarCloud**:
- Code quality metrics
- Security vulnerabilities
- Code smells

**RSP Integration**:
- Quality gates for AI code
- Track AI code quality separately
- Continuous monitoring

---

## Documentation

### Markdown

**Essential Format**: All RSP documentation

**Structure**:
```
docs/
├── architecture/
├── decisions/  # ADRs
└── api/

prompts/
├── templates/
└── [date]-[description].md
```

---

### Documentation Generators

**JSDoc / TSDoc**:
```typescript
/**
 * Hash password securely
 * @AI-Generated: Yes
 * @Prompt: prompts/2024-02-14-password-hashing.md
 */
```

**Sphinx (Python)**:
```python
def hash_password(password: str) -> str:
    """
    Hash password using bcrypt.

    AI-Generated: Yes
    Prompt: prompts/2024-02-14-password-hashing.md
    """
```

---

### API Documentation

**OpenAPI / Swagger**:
- AI can generate specs
- Human reviews accuracy
- Version alongside code

**RSP Practice**:
- Generate from code
- Validate completeness
- Keep in sync

---

## Automation

### CI/CD Pipelines

**GitHub Actions Example**:
```yaml
name: AI Code Validation

on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Run Tests
        run: npm test

      - name: Check Coverage
        run: npm run test:coverage

      - name: Lint
        run: npm run lint

      - name: Security Scan
        run: npm audit

      - name: Type Check
        run: npm run type-check
```

---

### Pre-commit Hooks

**Husky Example**:
```json
{
  "husky": {
    "hooks": {
      "pre-commit": "npm run lint && npm test",
      "commit-msg": "validate-commit-msg"
    }
  }
}
```

**RSP Hook**:
```bash
#!/bin/bash
# .git/hooks/commit-msg

# Check AI-generated commits reference prompts
if grep -q "AI-Generated: Yes" "$1"; then
    if ! grep -q "Prompt:" "$1"; then
        echo "Error: AI-generated commit must reference prompt"
        exit 1
    fi
fi
```

---

### Script Automation

**Prompt Validation**:
```bash
#!/bin/bash
# scripts/validate-prompts.sh

for file in prompts/*.md; do
    if ! grep -q "## Context" "$file"; then
        echo "Warning: $file missing Context section"
    fi
done
```

**Metrics Collection**:
```bash
#!/bin/bash
# scripts/ai-code-stats.sh

# Count AI-generated commits
git log --all --grep="AI-Generated: Yes" --oneline | wc -l
```

---

## Tool Recommendations by Use Case

### Solo Developer
**Minimal Setup**:
- AI Assistant: Claude Code or Cursor
- Version Control: Git + GitHub
- IDE: VS Code
- Testing: Jest/pytest
- Documentation: Markdown

---

### Small Team (2-10)
**Team Collaboration**:
- AI Assistant: Team license (Cursor, Claude, Copilot)
- Version Control: GitHub/GitLab
- CI/CD: GitHub Actions
- Testing: Jest/pytest + coverage
- Code Quality: ESLint + Prettier
- Documentation: Markdown + wiki

---

### Enterprise (10+)
**Full Stack**:
- AI Assistant: Enterprise licenses
- Version Control: GitHub Enterprise / GitLab
- CI/CD: Jenkins / GitHub Actions / GitLab CI
- Testing: Full test suites
- Security: Snyk, SonarQube
- Documentation: Confluence / Internal wiki
- Governance: Custom tooling

---

## Integration Patterns

### Pattern: AI + TDD

```
1. Write tests (human or AI)
2. AI generates implementation
3. Run tests
4. Iterate until passing
```

### Pattern: AI + Code Review

```
1. AI generates code
2. Automated checks (lint, test, security)
3. Human review
4. Merge
```

### Pattern: Progressive Validation

```
1. AI generates code
2. Immediate: Lint, type check
3. Pre-commit: Tests, coverage
4. CI/CD: Full validation suite
5. Post-deploy: Monitoring
```

---

## Building Custom Tools

### Prompt Template Generator
```bash
#!/bin/bash
# prompt-new.sh

cat > "prompts/$(date +%Y-%m-%d)-$1.md" <<EOF
# $1

**Date**: $(date +%Y-%m-%d)
**Author**: $USER

## Context
[Project context]

## Goal
[What to achieve]

## Requirements
[Requirements]

## Expected Output
[Expected result]
EOF
```

### ADR Generator
Similar script for decision records

### Metrics Dashboard
Custom dashboard for your metrics

---

## Next Steps

- Choose tools appropriate for your context
- Set up version control for prompts
- Configure automated validation
- Review [Case Studies](case-studies.md) for tool choices
- Share your tool experiences with community
