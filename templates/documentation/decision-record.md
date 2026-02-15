<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Architecture Decision Record Template

## Template

```markdown
# ADR-[NUMBER]: [TITLE]

**Date**: YYYY-MM-DD
**Status**: [Proposed | Accepted | Deprecated | Superseded]
**Deciders**: [List people involved]

## Context

What is the issue or problem we're addressing?

[Describe the forces at play: technical, political, social, project context]

## Decision

What decision did we make?

[Describe the chosen solution in detail]

## AI Involvement

### AI Assistant Used
[Tool name and version]

### Prompt Reference
[Link to prompt file: prompts/YYYY-MM-DD-description.md]

### AI Contribution
[What AI helped with: evaluation of options, implementation design, etc.]

### Human Decisions
[What humans decided that AI didn't]

## Alternatives Considered

### Option 1: [Name]
**Pros**: [List]
**Cons**: [List]
**Rejected because**: [Reason]

### Option 2: [Name]
**Pros**: [List]
**Cons**: [List]
**Rejected because**: [Reason]

## Consequences

### Positive
- [Benefit 1]
- [Benefit 2]

### Negative
- [Trade-off 1]
- [Trade-off 2]

### Risks
- [Risk 1 and mitigation]
- [Risk 2 and mitigation]

## Implementation

### Affected Components
[List components that will change]

### Migration Path
[If applicable, how to migrate from old to new]

### Timeline
[When will this be implemented]

## References

- [Related ADRs]
- [Documentation links]
- [Discussion links]

## Notes

[Any additional context or future considerations]
```

## Example

```markdown
# ADR-0003: Use JWT for API Authentication

**Date**: 2024-02-14
**Status**: Accepted
**Deciders**: Tech Lead, Security Team, Backend Team

## Context

Our REST API needs a stateless authentication mechanism. Multiple clients (web, mobile) will access the API. Current session-based auth doesn't work well for mobile clients or horizontal scaling.

## Decision

Implement JWT-based authentication with refresh tokens stored in the database.

## AI Involvement

### AI Assistant Used
Claude Sonnet 4.5

### Prompt Reference
prompts/2024-02-14-auth-strategy-evaluation.md

### AI Contribution
- Evaluated trade-offs between session-based, token-based, and OAuth
- Proposed JWT implementation architecture
- Generated initial security considerations list

### Human Decisions
- Final choice of JWT over alternatives
- Specific token expiry times (24h access, 7d refresh)
- Database choice for refresh tokens

## Alternatives Considered

### Option 1: Session-Based Authentication
**Pros**:
- Simpler to implement
- Can revoke immediately
**Cons**:
- Requires sticky sessions or shared session store
- Not mobile-friendly
- Harder to scale horizontally
**Rejected because**: Doesn't meet mobile and scalability requirements

### Option 2: OAuth 2.0
**Pros**:
- Industry standard
- Handles delegation well
**Cons**:
- Overkill for our use case
- Complex implementation
- Longer development time
**Rejected because**: Too complex for our current needs

## Consequences

### Positive
- Stateless authentication enables horizontal scaling
- Standard approach with good library support
- Mobile-friendly
- Microservices-ready

### Negative
- Cannot invalidate access tokens before expiry
- Requires refresh token rotation strategy
- Slight increase in request payload size
- Need to manage token storage on client

### Risks
- **Token theft**: Mitigated by short-lived access tokens and HTTPS
- **Refresh token compromise**: Mitigated by refresh token rotation and storage in httpOnly cookies

## Implementation

### Affected Components
- Authentication service
- API middleware
- User service
- Frontend auth module
- Mobile app auth

### Migration Path
1. Implement JWT auth alongside existing session auth
2. Migrate web client to JWT
3. Launch mobile app with JWT
4. Deprecate session auth after 2 months

### Timeline
- Week 1-2: Implementation
- Week 3: Testing
- Week 4: Rollout

## References

- [JWT Best Practices](https://datatracker.ietf.org/doc/html/rfc8725)
- [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
- Implementation: src/auth/jwt-service.ts

## Notes

Consider adding OAuth 2.0 in future if we need third-party integrations or delegation.
```

## Tips

- Write ADRs for significant decisions
- Include AI's role transparently
- Document alternatives considered
- Update status as decisions evolve
- Link related ADRs

## See Also

- [Audit Trails](../../docs/02-framework/reproducible/audit-trails.md)
- [Knowledge Persistence](../../docs/03-patterns/context-management/knowledge-persistence.md)
