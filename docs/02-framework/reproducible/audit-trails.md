<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Audit Trails for AI Development

## Overview

Audit trails document the reasoning, decisions, and outcomes of AI interactions, enabling accountability and continuous improvement.

## Why Audit Trails Matter

### Accountability
- Track who made decisions and why
- Understand the reasoning behind code choices
- Maintain compliance and governance

### Learning
- Identify successful patterns
- Learn from failures
- Share knowledge across teams

### Debugging
- Trace issues to their source
- Understand context of past decisions
- Reproduce and fix problems

## What to Document

### 1. Significant Decisions
Major architectural or design choices

**Example**:
- Choice of authentication strategy
- Database selection
- Framework or library adoption

### 2. AI Interactions
Key prompts and their results

**Example**:
- Complex feature implementations
- Refactoring decisions
- Problem-solving approaches

### 3. Validation Results
Testing and review outcomes

**Example**:
- Code review findings
- Test results
- Performance benchmarks
- Security scan results

### 4. Issues and Resolutions
Problems encountered and how they were solved

**Example**:
- AI-generated code that needed fixes
- Prompt refinements
- Context adjustments

## Documentation Formats

### Architecture Decision Records (ADRs)

Template:

```markdown
# ADR-[NUMBER]: [TITLE]

## Status
[Proposed | Accepted | Deprecated | Superseded]

## Context
What is the issue we're trying to solve?

## Decision
What decision did we make?

## Consequences
What are the positive and negative outcomes?

## AI Involvement
- AI Assistant: [Tool used]
- Prompt: [Link to prompt file]
- Rationale: [Why AI was used]

## Alternatives Considered
What other options were evaluated?

## References
Links to relevant documents or discussions
```

Example:

```markdown
# ADR-0003: Use JWT for API Authentication

## Status
Accepted

## Context
Our REST API needs a stateless authentication mechanism.
Multiple clients (web, mobile) will access the API.

## Decision
Implement JWT-based authentication with refresh tokens.

## Consequences
**Positive:**
- Stateless authentication enables horizontal scaling
- Standard approach with good library support
- Mobile-friendly

**Negative:**
- Cannot invalidate tokens before expiry
- Requires refresh token rotation strategy
- Slight increase in request size

## AI Involvement
- AI Assistant: Claude Code
- Prompt: prompts/2024-02-14-auth-strategy-evaluation.md
- Rationale: AI helped evaluate trade-offs between session-based and token-based auth

## Alternatives Considered
1. Session-based authentication (rejected: not mobile-friendly)
2. OAuth 2.0 (rejected: overkill for our use case)
3. API keys (rejected: not suitable for user authentication)

## References
- [JWT Best Practices](https://example.com)
- Implementation: src/auth/jwt.js
```

### Prompt Result Logs

Template:

```markdown
# Prompt Result: [BRIEF DESCRIPTION]

**Date**: YYYY-MM-DD
**Prompt File**: [Link to prompt]
**AI Assistant**: [Tool]

## Summary
Brief description of what was accomplished

## Quality Assessment
- Code Quality: ⭐⭐⭐⭐⭐
- Accuracy: ⭐⭐⭐⭐☆
- Completeness: ⭐⭐⭐⭐⭐
- Security: ⭐⭐⭐⭐☆

## What Worked Well
- [Positive aspect 1]
- [Positive aspect 2]

## What Needed Adjustment
- [Issue 1 and fix]
- [Issue 2 and fix]

## Lessons Learned
- [Learning 1]
- [Learning 2]

## Follow-up Actions
- [ ] Action item 1
- [ ] Action item 2
```

### Change Log for AI Decisions

```markdown
# AI Development Changelog

## 2024-02-14
### Added
- User authentication endpoints (AI-generated)
  - Prompt: prompts/2024-02-14-user-auth.md
  - Review: Passed with minor adjustments
  - Tests: Added, all passing

### Modified
- Refactored user service for better separation of concerns
  - Prompt: prompts/2024-02-14-refactor-user-service.md
  - Reason: Prepare for authentication integration
  - Review: Approved

### Issues Resolved
- Fixed JWT token expiry handling
  - Original AI output had timezone issue
  - Manual correction in commit abc123
  - Updated prompt template for future use
```

## Implementation Levels

### Level 1: Minimal
- ADRs for major decisions
- Commit messages reference AI usage
- Simple changelog

### Level 2: Standard
- ADRs for significant decisions
- Prompt result logs for complex features
- Structured changelog
- Quarterly review of AI effectiveness

### Level 3: Comprehensive
- All AI interactions documented
- Automated metrics collection
- Regular retrospectives
- Published case studies

## Directory Structure

```
your-project/
├── decisions/
│   ├── README.md
│   ├── 0001-initial-architecture.md
│   ├── 0002-jwt-authentication.md
│   └── template.md
│
├── prompts/
│   └── results/
│       ├── 2024-02-14-auth-implementation.md
│       └── 2024-02-15-refactoring-results.md
│
└── docs/
    └── ai-development-log.md
```

## Automation

### Git Commit Template

```bash
# .gitmessage

# Type: feat, fix, refactor, docs, test, chore
# Scope: auth, api, database, etc.

Type(scope): Brief description

AI-Generated: [Yes/No]
Prompt: [Link to prompt file if Yes]
Reviewed: [Yes/No]
Tests: [Added/Updated/None]

# Longer description if needed

# Related issues or ADRs
Refs: #issue-number
ADR: decisions/####-title.md
```

### Pre-commit Hook for Audit

```bash
#!/bin/bash
# Ensure AI-generated code is properly documented

if git log -1 --pretty=%B | grep -q "AI-Generated: Yes"; then
    # Check prompt reference exists
    if ! git log -1 --pretty=%B | grep -q "Prompt:"; then
        echo "❌ AI-generated commits must reference a prompt file"
        exit 1
    fi

    # Check review status
    if ! git log -1 --pretty=%B | grep -q "Reviewed: Yes"; then
        echo "⚠️  Warning: AI-generated code not marked as reviewed"
        read -p "Continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
fi
```

## Best Practices

### DO
✅ Document significant decisions
✅ Include rationale and context
✅ Link to related prompts
✅ Record lessons learned
✅ Review and update regularly

### DON'T
❌ Document trivial interactions
❌ Copy-paste without context
❌ Skip the "why" behind decisions
❌ Let documentation go stale
❌ Make it a bureaucratic burden

## Review Process

### Weekly Review
- Check recent AI interactions
- Document any issues or patterns
- Update prompt templates

### Monthly Review
- Analyze AI effectiveness metrics
- Identify trends and patterns
- Update best practices

### Quarterly Review
- Comprehensive retrospective
- Share learnings across teams
- Refine documentation process

## Metrics and Analytics

### Track
- AI vs manual code ratio
- Prompt success rate
- Code review findings for AI code
- Time savings from AI usage
- Common issues and patterns

### Dashboards
Create simple dashboards to visualize:
- AI usage over time
- Quality metrics
- Team adoption
- ROI estimation

## Compliance and Governance

### For Regulated Industries

**Required Documentation**:
- Who initiated AI interaction
- What prompt was used
- How output was validated
- Who reviewed and approved

**Retention Policies**:
- Define how long to keep records
- Where to store audit trails
- Who has access

**Review Requirements**:
- Mandatory human review
- Sign-off process
- Audit trail completeness checks

## Tools and Integrations

### Documentation Tools
- **Markdown + Git**: Simple, version-controlled
- **Confluence**: Team collaboration
- **Notion**: Flexible documentation
- **ADR Tools**: Automated ADR management

### Analytics Tools
- **Grafana**: Metrics visualization
- **Custom scripts**: Extract insights from git history
- **GitHub Insights**: Repository analytics

### Automation
- **GitHub Actions**: Automated checks
- **Git hooks**: Enforce documentation
- **Scripts**: Generate reports

## Common Challenges

### Challenge: Too Much Overhead
**Solution**: Document only significant interactions, automate where possible

### Challenge: Finding Old Information
**Solution**: Good naming conventions, regular indexing, search tools

### Challenge: Keeping Up-to-Date
**Solution**: Make it part of the workflow, not a separate task

### Challenge: Team Adoption
**Solution**: Lead by example, show value, start small

## Examples

See [Case Studies](../pragmatic/case-studies.md) for real-world examples of effective audit trails.

## Next Steps

- Set up decision records structure
- Create first ADR for AI usage
- Implement commit message template
- Add [Testing](testing.md) validation
- Explore [Patterns](../../03-patterns/README.md)
