<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Knowledge Persistence Pattern

## Intent
Store and reuse context across sessions and team members for consistent AI interactions.

## Context
- Long-term projects
- Team collaboration
- Onboarding new developers
- Maintaining consistency across time

## Problem
Each AI session starts fresh. Without persistent context, teams waste time repeating information, risking inconsistency and losing accumulated knowledge.

## Solution
Create and maintain structured context documents that can be reused across sessions and shared across teams.

## Key Concepts

### 1. Context as Code
Treat context documentation like code:
- Version controlled
- Reviewed and updated
- Organized systematically
- Maintained over time

### 2. Reusable Context Library
Build a library of context documents:
- Project-wide context
- Module-specific context
- Pattern templates
- Decision records

### 3. Living Documentation
Context documents that evolve:
- Updated as project changes
- Reflect current state
- Link to code
- Track history

## Context Repository Structure

```
project/
├── context/
│   ├── README.md                    # Index of all context
│   ├── project-overview.md          # High-level project info
│   ├── architecture.md              # System architecture
│   ├── tech-stack.md                # Technologies used
│   ├── conventions.md               # Coding standards
│   ├── modules/
│   │   ├── auth-module.md           # Auth-specific context
│   │   ├── user-module.md           # User-specific context
│   │   └── api-module.md            # API-specific context
│   └── templates/
│       ├── feature-template.md      # Template for features
│       └── bug-fix-template.md      # Template for bug fixes
│
├── decisions/                       # ADRs
│   ├── 0001-jwt-auth.md
│   ├── 0002-database-choice.md
│   └── ...
│
└── prompts/                         # Historical prompts
    ├── 2024-02-14-user-auth.md
    └── ...
```

## Context Document Templates

### Project Overview
```markdown
# Project Context: [Project Name]

**Last Updated**: 2024-02-14

## What This Project Does
[1-2 sentence description]

## Tech Stack
- Backend: Node.js + Express
- Database: PostgreSQL
- Frontend: React + TypeScript
- Hosting: AWS

## Key Patterns
- Service layer architecture
- JWT authentication
- RESTful APIs
- Test-driven development

## Important Constraints
- HIPAA compliance required
- Performance: APIs < 200ms
- Uptime: 99.9% SLA

## For More Details
- Architecture: context/architecture.md
- API docs: docs/api/README.md
- Onboarding: docs/ONBOARDING.md
```

### Module Context
```markdown
# Module Context: Authentication

## Purpose
Handles user authentication and session management

## Location
`src/auth/`

## Key Components
- `AuthService`: Core auth logic
- `JWTService`: Token management
- `PasswordService`: Password hashing
- `AuthController`: HTTP endpoints

## Usage
```typescript
import { AuthService } from './auth/AuthService';
const auth = new AuthService(db);
await auth.login(email, password);
```

## Important Notes
- Uses bcrypt with 10 salt rounds
- JWT tokens expire in 24 hours
- Refresh tokens stored in database
- Rate limiting: 5 attempts per 15 minutes

## Related
- ADR: decisions/0001-jwt-auth.md
- Tests: src/auth/__tests__/
- API docs: docs/api/auth.md
```

## Usage Patterns

### Pattern 1: Reference in Prompts

```markdown
# Implement User Profile Feature

## Project Context
See: context/project-overview.md
See: context/modules/user-module.md

## Feature Specific Context
[Additional details specific to this task]

## Implementation
[Prompt details]
```

### Pattern 2: Context Inheritance

```markdown
# Implement Password Reset

## Inherited Context
- Project: context/project-overview.md
- Auth Module: context/modules/auth-module.md
- Email patterns: context/modules/email-module.md

## Specific Requirements
[Task-specific details]
```

### Pattern 3: Progressive Loading

```markdown
# Prompt with Embedded Context

## Quick Context
- Project: User management SaaS
- Stack: Node.js + React + PostgreSQL
- Pattern: Service layer + REST APIs

[Full details: context/project-overview.md]

## Task
[Specific task details]
```

## Maintenance Strategies

### Weekly Maintenance
```markdown
# Context Review Checklist

Weekly:
- [ ] Review project-overview.md for accuracy
- [ ] Update tech-stack.md if dependencies changed
- [ ] Check module contexts match current code
- [ ] Update any outdated examples
```

### Update Triggers
Update context when:
- Major architectural changes
- New modules added
- Tech stack changes
- Team conventions evolve
- Patterns emerge

### Version Control
```bash
# Context changes in commits
git commit -m "docs: Update auth context after JWT refresh token changes"

# Tag major context updates
git tag -a context-v2.0 -m "Updated context after microservices migration"
```

## Team Collaboration

### Shared Context Library

**Benefits**:
- Consistent AI interactions across team
- Faster onboarding
- Shared learnings
- Reduces repetition

**Implementation**:
```markdown
<!-- context/README.md -->
# Team Context Library

## How to Use
1. Find relevant context document
2. Reference in your prompts
3. Update if you notice inaccuracies
4. Add new contexts as needed

## Available Contexts
- [Project Overview](project-overview.md) - Start here
- [Architecture](architecture.md) - System design
- [Modules](modules/) - Component-specific
- [Templates](templates/) - Reusable templates

## Contributing
When adding new context:
- Use provided templates
- Keep concise and relevant
- Link to detailed docs
- Review with team
```

### Context Ownership

Assign owners:
```markdown
# Context Document Ownership

| Context | Owner | Last Review |
|---------|-------|-------------|
| project-overview.md | @lead | 2024-02-01 |
| architecture.md | @architect | 2024-01-15 |
| auth-module.md | @security-team | 2024-02-10 |
```

## Tools and Automation

### Context Validator Script
```bash
#!/bin/bash
# validate-context.sh

# Check context documents exist
for ctx in context/*.md; do
    if ! grep -q "Last Updated" "$ctx"; then
        echo "Warning: $ctx missing 'Last Updated'"
    fi
done

# Check for broken links
find context/ -name "*.md" -exec \
    grep -H "](.*\.md)" {} \; | while read line; do
    # Validate links exist
done
```

### Auto-Update Reminders
```yaml
# .github/workflows/context-reminder.yml
name: Context Update Reminder

on:
  schedule:
    - cron: '0 0 * * 1'  # Weekly on Monday

jobs:
  remind:
    runs-on: ubuntu-latest
    steps:
      - name: Check Last Update
        run: |
          # Check when context was last updated
          # Create issue if > 30 days
```

## Integration with AI Tools

### CLAUDE.md / .aicontext
```markdown
<!-- CLAUDE.md -->
# Project Context for AI Assistants

## Quick Reference
- Type: User management SaaS
- Stack: Node.js + TypeScript + PostgreSQL
- Architecture: Service layer + REST APIs

## Code Organization
- Services: `src/services/`
- Controllers: `src/controllers/`
- Models: `src/models/`
- Tests: Co-located `__tests__/`

## Patterns
- Follow service layer pattern
- Use dependency injection
- Write tests for all services
- Document with JSDoc

## More Details
See `context/` directory for comprehensive documentation
```

## Best Practices

### DO
✅ Keep context current
✅ Structure logically
✅ Link to detailed docs
✅ Review regularly
✅ Share across team
✅ Version control everything

### DON'T
❌ Let context go stale
❌ Duplicate information
❌ Include irrelevant details
❌ Forget to update
❌ Keep private (share with team)
❌ Over-document simple things

## Measuring Success

### Indicators
- Team references context consistently
- Fewer "how do we do X" questions
- New developers productive faster
- Consistent AI outputs across team
- Context stays up-to-date

### Metrics
- Context reference rate in prompts
- Time to onboard new developers
- Consistency of AI outputs
- Context update frequency

## Related Patterns

- **Context Windows**: Managing token limits
- **Session Continuity**: Multi-turn interactions
- **Context Inheritance**: Reusing base context

## Next Steps

- Create your first context document
- Set up context/ directory structure
- Establish update cadence
- Share with team
- Iterate based on usage
