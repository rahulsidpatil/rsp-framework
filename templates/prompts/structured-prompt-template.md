# Structured Prompt Template

## Purpose
General-purpose template for structured AI interactions. Adapt for any development task.

## Template

```markdown
# [Task Title]

**Date**: [YYYY-MM-DD]
**Author**: [Your Name]
**AI Assistant**: [Tool Name]

## Context

### Project
- **Type**: [Web app, API, library, etc.]
- **Tech Stack**: [Languages, frameworks, databases]
- **Architecture**: [Pattern/structure]

### Current State
- [What exists now]
- [Relevant background]

### Constraints
- [Technical constraints]
- [Business constraints]
- [Timeline constraints]

## Goal

[Clear statement of what you want to achieve]

## Requirements

### Functional Requirements
1. [Requirement 1]
2. [Requirement 2]
3. [Requirement 3]

### Non-Functional Requirements
- **Performance**: [Expectations]
- **Security**: [Requirements]
- **Scalability**: [Needs]
- **Accessibility**: [Standards]

### [OPTIONAL] User Stories
- As a [role], I want [feature] so that [benefit]

## Technical Specifications

### [OPTIONAL] Input/Output
- **Inputs**: [What the code receives]
- **Outputs**: [What it returns/produces]
- **Side Effects**: [Database writes, API calls, etc.]

### [OPTIONAL] Interface/API Design
[Function signatures, endpoints, props, etc.]

### [OPTIONAL] Data Models
[Relevant data structures]

### Dependencies
- **External**: [Libraries, services]
- **Internal**: [Other modules]

## Quality Requirements

### Code Style
- Follow [style guide/linter]
- Naming conventions: [Describe]
- Documentation: [JSDoc, comments, etc.]

### Error Handling
- Validate all inputs
- Handle edge cases: [List specific ones]
- Error responses: [Format]

### Security
- [Security requirements]
- [Authentication/authorization]
- [Data protection]

### Testing
- Include unit tests
- Test coverage: [X%]
- Key scenarios: [List]

### Performance
- [Performance targets]
- [Optimization priorities]

## Examples

### [OPTIONAL] Similar Existing Code
```[language]
[Code example]
```

### [OPTIONAL] Desired Output Format
```[language]
[Example of what you want]
```

## Expected Deliverables

Please provide:
- [ ] Implementation code
- [ ] Inline documentation
- [ ] Error handling
- [ ] Input validation
- [ ] Unit tests
- [ ] Usage examples

## [OPTIONAL] Follow-up Questions

If anything is unclear, please ask about:
- [Topic 1]
- [Topic 2]

---

## Notes
[Any additional context or considerations]
```

## Usage Example

```markdown
# Implement Password Reset Feature

**Date**: 2024-02-14
**Author**: Jane Developer
**AI Assistant**: Claude

## Context

### Project
- **Type**: SaaS web application
- **Tech Stack**: Node.js, Express, React, PostgreSQL
- **Architecture**: Service layer pattern, REST APIs

### Current State
- User authentication exists (JWT-based)
- Email service is set up (SendGrid)
- User model has email field

### Constraints
- Must comply with security best practices
- Email templates already designed
- 24-hour reset link expiry required

## Goal

Implement secure password reset functionality allowing users to reset forgotten passwords via email.

## Requirements

### Functional Requirements
1. User requests password reset by providing email
2. System sends email with unique reset link
3. User clicks link and enters new password
4. Password is updated and user can log in

### Non-Functional Requirements
- **Performance**: Reset request < 2 seconds
- **Security**: Secure token generation, one-time use links
- **Scalability**: Handle 1000 requests/day

## Technical Specifications

### API Endpoints
```
POST /api/auth/password-reset/request
  Body: { email: string }
  Returns: { message: string }

POST /api/auth/password-reset/confirm
  Body: { token: string, newPassword: string }
  Returns: { message: string }

GET /api/auth/password-reset/verify/:token
  Returns: { valid: boolean }
```

### Dependencies
- **External**: bcrypt, crypto
- **Internal**: UserService, EmailService, TokenService

## Quality Requirements

### Code Style
- Follow Airbnb style guide (ESLint configured)
- TypeScript strict mode
- JSDoc for public methods

### Error Handling
- Validate email format
- Validate password strength
- Handle non-existent users gracefully (don't reveal if email exists)
- Handle expired tokens

### Security
- Cryptographically secure tokens
- Tokens expire in 24 hours
- One-time use tokens
- Rate limiting: 3 requests per hour per IP

### Testing
- Unit tests for all services
- Test coverage: 90%
- Test scenarios: valid request, invalid email, expired token, reused token

## Examples

### Similar Pattern (Login)
Our login endpoint follows this pattern:
```typescript
async login(email: string, password: string): Promise<LoginResult> {
  const user = await this.userRepo.findByEmail(email);
  if (!user || !await this.verifyPassword(password, user.passwordHash)) {
    throw new AuthenticationError('Invalid credentials');
  }
  return this.generateTokens(user);
}
```

## Expected Deliverables

Please provide:
- [ ] PasswordResetService with request/confirm methods
- [ ] API route handlers
- [ ] Token generation and validation
- [ ] Email sending integration
- [ ] Comprehensive unit tests
- [ ] API documentation

---

## Notes
- Follow the same error handling pattern as existing auth code
- Ensure tokens are stored securely (hashed in database)
- Log all password reset attempts for security monitoring
```

## Tips for Success

1. **Be Specific**: More detail = better results
2. **Provide Context**: Help AI understand your environment
3. **Set Standards**: Explicitly state quality expectations
4. **Include Examples**: Show similar code or desired patterns
5. **Request Tests**: Always ask for test coverage
6. **Iterate**: Refine the prompt if results aren't perfect

## Common Mistakes

❌ Too vague: "Create a login system"
✅ Specific: Use this template with detailed requirements

❌ Missing context: No tech stack or constraints mentioned
✅ Complete context: Full project and technical context

❌ No quality requirements: AI might skip tests or security
✅ Explicit standards: Clear expectations for quality

## Next Steps

- Copy this template for your next task
- Customize for your project
- Build a library of your successful variations
- Share improvements with the team

## Related

- [Requirements Prompt](requirements-prompt.md) - Extract requirements first
- [Code Generation Prompt](code-generation-prompt.md) - Implementation-focused
- [Testing Prompt](testing-prompt.md) - Generate tests
