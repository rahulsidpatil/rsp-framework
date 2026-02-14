# Context Management Patterns

## Overview

Effective strategies for managing information flow to AI assistants. Proper context management is crucial for getting accurate, relevant results from AI coding tools.

## Why Context Management Matters

AI assistants need the right information at the right time. Too little context leads to generic or incorrect outputs. Too much context wastes tokens and may confuse the AI.

## Available Patterns

### [Context Windows](context-windows.md)
Managing information within token limits

**Key Concepts**:
- Token budget management
- Information prioritization
- Chunking strategies
- Context compression

**Use When**: Working with large codebases or complex features

---

### [Session Continuity](session-continuity.md)
Maintaining context across multiple interactions

**Key Concepts**:
- Session state management
- Reference previous interactions
- Building on prior work
- Incremental development

**Use When**: Multi-step development tasks or iterative refinement

---

### [Knowledge Persistence](knowledge-persistence.md)
Storing and reusing context across sessions

**Key Concepts**:
- Context documents
- Project knowledge base
- Reusable context templates
- Documentation as context

**Use When**: Long-term projects or team collaboration

---

## Context Management Principles

### 1. Relevance Over Volume
Provide relevant information, not everything

### 2. Structure Over Dump
Organize context logically, don't just paste

### 3. Layered Information
Essential → Important → Reference

### 4. Reusability
Create reusable context documents

### 5. Maintenance
Keep context up-to-date

## Common Context Types

### Project Context
- Architecture overview
- Tech stack
- Conventions and standards
- Key dependencies

### Domain Context
- Business rules
- Domain terminology
- User workflows
- Industry requirements

### Technical Context
- API contracts
- Data models
- Integration points
- Performance requirements

### Historical Context
- Previous decisions (ADRs)
- Evolution of features
- Known issues
- Lessons learned

## Context Management Strategies

### Strategy: Context Inheritance
Create base context documents that can be referenced

```
context/
├── base.md           # Core project info
├── architecture.md   # System design
└── conventions.md    # Code standards

prompts/
└── feature-x.md     # References: context/base.md
```

### Strategy: Layered Context
Provide information in priority order

```markdown
## Essential Context
[Must-know information]

## Additional Context
[Helpful details]

## Reference
[Available if needed, links to docs]
```

### Strategy: Progressive Disclosure
Start minimal, add context as needed

```
Interaction 1: Basic prompt
Interaction 2: + specific context
Interaction 3: + edge cases
```

## Best Practices

### DO
✅ Structure context logically
✅ Prioritize relevant information
✅ Use references to external docs
✅ Update context regularly
✅ Create reusable templates

### DON'T
❌ Dump entire codebase
❌ Repeat same context every time
❌ Include outdated information
❌ Assume AI remembers from last session
❌ Over-explain simple concepts

## Token Management

### Understand Token Limits
- Claude: 200k tokens (~150k words)
- GPT-4: 8k-128k tokens
- Others: Varies

### Estimate Token Usage
- 1 token ≈ 4 characters
- 1 token ≈ 0.75 words
- Code: ~1.5 tokens per word

### Optimize Context
- Remove redundancy
- Compress examples
- Link to docs instead of including
- Use summaries for large files

## Tools and Techniques

### Context Documents
```markdown
<!-- context/project-overview.md -->
# Project: User Management System

## Tech Stack
- Backend: Node.js + Express
- Database: PostgreSQL
- Auth: JWT

## Key Concepts
- Users have roles: admin, user, guest
- All APIs require authentication
- Rate limiting: 100 req/min per user

[Link to full docs: docs/architecture.md]
```

### Context Templates
```markdown
<!-- context/template-feature.md -->
# Feature: [NAME]

## Purpose
[What it does]

## Integration Points
[How it connects]

## Special Considerations
[Important notes]
```

### .aicontext or CLAUDE.md Files
Some AI tools read special files:
```markdown
<!-- .aicontext or CLAUDE.md -->
# Project Context

This is a Node.js/TypeScript project following...

Key patterns:
- Services in src/services/
- Tests co-located in __tests__/
- ...
```

## Measuring Effectiveness

### Metrics
- Relevance of AI responses
- Number of clarifying questions needed
- First-response accuracy
- Token usage efficiency

### Success Indicators
- AI produces relevant outputs first try
- Minimal context iteration needed
- Consistent quality across sessions
- Team can reuse context effectively

## Next Steps

- Read [Context Windows](context-windows.md) for token management
- Learn [Session Continuity](session-continuity.md) for multi-step work
- Explore [Knowledge Persistence](knowledge-persistence.md) for long-term projects
- Create your first context document
