<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Context Document Template

Reusable context for AI interactions.

## Template

```markdown
# Project Context: [Project Name]

**Last Updated**: YYYY-MM-DD
**Maintained by**: [Team/Person]
**Version**: X.Y

## Quick Summary

[1-2 sentence project description]

## Tech Stack

### Backend
- Language: [e.g., TypeScript/Node.js]
- Framework: [e.g., Express.js]
- Database: [e.g., PostgreSQL]
- ORM: [e.g., Prisma]

### Frontend
- Language: [e.g., TypeScript]
- Framework: [e.g., React]
- State: [e.g., Redux]
- Styling: [e.g., Tailwind CSS]

### Infrastructure
- Hosting: [e.g., AWS]
- CI/CD: [e.g., GitHub Actions]
- Monitoring: [e.g., DataDog]

## Architecture

### High-Level
[Brief architecture description or link to diagram]

### Key Patterns
- [Pattern 1]: [Description]
- [Pattern 2]: [Description]

### Directory Structure
```
src/
├── services/     # Business logic
├── controllers/  # HTTP handlers
├── models/       # Data models
├── middleware/   # Express middleware
└── utils/        # Utilities
```

## Coding Conventions

### Style
- Linter: ESLint (Airbnb config)
- Formatter: Prettier
- TypeScript: Strict mode

### Naming
- Files: kebab-case.ts
- Classes: PascalCase
- Functions: camelCase
- Constants: UPPER_SNAKE_CASE

### Documentation
- JSDoc for public APIs
- Comments for complex logic
- README for each module

## Common Patterns

### Service Layer
```typescript
export class UserService {
  constructor(private db: Database) {}

  async create(data: CreateUserData): Promise<User> {
    // Implementation
  }
}
```

### Error Handling
```typescript
try {
  // Operation
} catch (error) {
  logger.error('Context:', error);
  throw new AppError('User message', 500);
}
```

### Testing
```typescript
describe('UserService', () => {
  let service: UserService;

  beforeEach(() => {
    service = new UserService(mockDb);
  });

  test('creates user successfully', async () => {
    // Test
  });
});
```

## Important Constraints

### Technical
- Node.js version: >= 18
- TypeScript version: >= 5.0
- Must support PostgreSQL 14+

### Business
- GDPR compliance required
- HIPAA compliance required
- PCI-DSS for payments

### Performance
- API response time: < 200ms (p95)
- Database queries: < 100ms
- Page load: < 2s

## Security Requirements

- All inputs validated
- SQL injection prevention (use parameterized queries)
- XSS prevention (sanitize outputs)
- Authentication required for all APIs except /health
- Authorization checks for resource access
- Passwords hashed with bcrypt (10 rounds)
- Secrets in environment variables, never in code

## Testing Requirements

- Unit tests: >= 80% coverage
- Integration tests for APIs
- E2E tests for critical flows
- All tests must pass before merge

## Deployment

### Environments
- Development: Local
- Staging: staging.example.com
- Production: app.example.com

### Process
1. PR merged to main
2. CI runs tests and builds
3. Auto-deploy to staging
4. Manual approval for production
5. Deploy to production

## Links

- **Repository**: [GitHub link]
- **Documentation**: [Wiki/Docs link]
- **Architecture Diagram**: [Link]
- **API Docs**: [Swagger/OpenAPI link]
- **Monitoring**: [Dashboard link]

## Team

- Tech Lead: @username
- Backend Team: @team-backend
- Frontend Team: @team-frontend
- DevOps: @devops

## Change Log

### Version 1.1 - 2024-02-14
- Added security requirements section
- Updated tech stack versions
- Added deployment process

### Version 1.0 - 2024-01-01
- Initial context document
```

## Usage in Prompts

```markdown
# Implement Feature X

## Context
See: context/project-overview.md

## Feature-Specific Context
[Additional context for this specific feature]

## Task
[Specific task details]
```

## Maintenance

- Review monthly
- Update after major changes
- Keep concise and current
- Remove outdated information

## See Also

- [Knowledge Persistence](../../docs/03-patterns/context-management/knowledge-persistence.md)
- [Context Windows](../../docs/03-patterns/context-management/context-windows.md)
