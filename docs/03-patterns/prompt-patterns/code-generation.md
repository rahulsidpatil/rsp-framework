# Code Generation Pattern

## Intent
Generate high-quality, production-ready code from structured specifications.

## Context
- Implementing features from requirements
- Creating boilerplate code
- Building new components
- Rapid prototyping

## Problem
Writing code from scratch is time-consuming and error-prone. AI can generate code, but without proper prompting, results are often incomplete, insecure, or don't follow project conventions.

## Solution
Use structured prompts that provide comprehensive context, clear specifications, and explicit quality requirements.

### Template

```markdown
# Implement: [Feature/Component Name]

## Project Context
- Language: [Programming language]
- Framework: [Framework/library]
- Architecture: [Pattern/structure]
- Existing code style: [Conventions]

## Requirements
[Clear, specific requirements - reference requirements extraction]

## Technical Specifications

### Input/Output
- Inputs: [What function/component receives]
- Outputs: [What it returns/renders]
- Side effects: [Database writes, API calls, etc.]

### Interface/API Design
[Function signatures, props, endpoints, etc.]

### Data Models
[Relevant data structures]

### Dependencies
- External libraries: [List with versions]
- Internal modules: [What to import]

## Quality Requirements

### Code Style
- Follow [style guide/linter config]
- Naming conventions: [Describe]
- Documentation: [JSDoc, comments, etc.]

### Error Handling
- Validate all inputs
- Handle edge cases: [List specific ones]
- Return/throw errors appropriately

### Security
- Input sanitization required
- Authentication/authorization: [Requirements]
- Sensitive data handling: [Guidelines]

### Performance
- Expected load: [Users, requests, etc.]
- Performance targets: [Response time, etc.]
- Optimization priorities: [What matters most]

### Testing
- Include unit tests
- Test coverage goals: [Percentage]
- Key test scenarios: [List important cases]

## Examples
[Similar existing code or desired output format]

## Please provide:
1. Implementation code
2. Inline documentation
3. Error handling
4. Input validation
5. Unit tests
6. Usage examples
```

## Example

### Input Prompt

```markdown
# Implement: Password Hashing Service

## Project Context
- Language: TypeScript
- Framework: Node.js / Express
- Architecture: Service layer pattern
- Existing code style: ESLint (Airbnb), Prettier

## Requirements
- Securely hash passwords using bcrypt
- Verify passwords against hashed values
- Configurable salt rounds
- Async operations

## Technical Specifications

### Input/Output
- hash(password: string): Promise<string>
- verify(password: string, hash: string): Promise<boolean>

### Dependencies
- External: bcrypt@5.1.1
- Internal: None

## Quality Requirements

### Code Style
- TypeScript strict mode
- Full type annotations
- JSDoc comments for public methods

### Error Handling
- Validate password is non-empty string
- Handle bcrypt errors gracefully
- Throw custom errors with clear messages

### Security
- Use bcrypt (industry standard)
- Default 10 salt rounds (configurable)
- Never log passwords or hashes

### Testing
- Unit tests with Jest
- Test: successful hash
- Test: successful verification
- Test: failed verification
- Test: empty password handling
- Test: custom salt rounds

## Please provide:
1. PasswordService class implementation
2. Full TypeScript types
3. JSDoc documentation
4. Comprehensive unit tests
```

### AI Response (Excerpt)

```typescript
// src/services/PasswordService.ts

import bcrypt from 'bcrypt';

/**
 * Configuration options for PasswordService
 */
interface PasswordServiceConfig {
  /** Number of salt rounds for bcrypt (default: 10) */
  saltRounds?: number;
}

/**
 * Service for securely hashing and verifying passwords using bcrypt
 *
 * @example
 * ```typescript
 * const service = new PasswordService();
 * const hash = await service.hash('myPassword123');
 * const isValid = await service.verify('myPassword123', hash);
 * ```
 */
export class PasswordService {
  private readonly saltRounds: number;

  /**
   * Creates a new PasswordService instance
   * @param config - Configuration options
   */
  constructor(config: PasswordServiceConfig = {}) {
    this.saltRounds = config.saltRounds ?? 10;
  }

  /**
   * Hashes a password using bcrypt
   *
   * @param password - Plain text password to hash
   * @returns Promise resolving to hashed password
   * @throws {Error} If password is empty or bcrypt fails
   *
   * @example
   * ```typescript
   * const hash = await service.hash('myPassword123');
   * // Returns: $2b$10$...
   * ```
   */
  async hash(password: string): Promise<string> {
    if (!password || password.trim().length === 0) {
      throw new Error('Password cannot be empty');
    }

    try {
      const hash = await bcrypt.hash(password, this.saltRounds);
      return hash;
    } catch (error) {
      throw new Error(`Password hashing failed: ${error.message}`);
    }
  }

  /**
   * Verifies a password against a hash
   *
   * @param password - Plain text password to verify
   * @param hash - Bcrypt hash to compare against
   * @returns Promise resolving to true if password matches, false otherwise
   * @throws {Error} If inputs are invalid or bcrypt fails
   *
   * @example
   * ```typescript
   * const isValid = await service.verify('myPassword123', hash);
   * // Returns: true or false
   * ```
   */
  async verify(password: string, hash: string): Promise<boolean> {
    if (!password || password.trim().length === 0) {
      throw new Error('Password cannot be empty');
    }

    if (!hash || hash.trim().length === 0) {
      throw new Error('Hash cannot be empty');
    }

    try {
      const isValid = await bcrypt.compare(password, hash);
      return isValid;
    } catch (error) {
      throw new Error(`Password verification failed: ${error.message}`);
    }
  }
}
```

```typescript
// src/services/__tests__/PasswordService.test.ts

import { PasswordService } from '../PasswordService';

describe('PasswordService', () => {
  let service: PasswordService;

  beforeEach(() => {
    service = new PasswordService();
  });

  describe('hash', () => {
    it('should hash a password successfully', async () => {
      const password = 'mySecurePassword123';
      const hash = await service.hash(password);

      expect(hash).toBeDefined();
      expect(hash).not.toBe(password);
      expect(hash).toMatch(/^\$2b\$/); // bcrypt hash format
    });

    it('should throw error for empty password', async () => {
      await expect(service.hash('')).rejects.toThrow('Password cannot be empty');
    });

    it('should throw error for whitespace-only password', async () => {
      await expect(service.hash('   ')).rejects.toThrow('Password cannot be empty');
    });

    it('should use custom salt rounds', async () => {
      const customService = new PasswordService({ saltRounds: 12 });
      const hash = await customService.hash('test');

      // Verify salt rounds in hash
      expect(hash.substring(0, 7)).toBe('$2b$12$');
    });
  });

  describe('verify', () => {
    it('should verify correct password', async () => {
      const password = 'mySecurePassword123';
      const hash = await service.hash(password);

      const isValid = await service.verify(password, hash);
      expect(isValid).toBe(true);
    });

    it('should reject incorrect password', async () => {
      const password = 'mySecurePassword123';
      const hash = await service.hash(password);

      const isValid = await service.verify('wrongPassword', hash);
      expect(isValid).toBe(false);
    });

    it('should throw error for empty password', async () => {
      const hash = await service.hash('test');
      await expect(service.verify('', hash)).rejects.toThrow('Password cannot be empty');
    });

    it('should throw error for empty hash', async () => {
      await expect(service.verify('test', '')).rejects.toThrow('Hash cannot be empty');
    });
  });
});
```

## Consequences

### Benefits
✅ High-quality, production-ready code
✅ Comprehensive error handling
✅ Tests included
✅ Follows project conventions
✅ Well-documented
✅ Security considerations addressed

### Trade-offs
⚠️ Requires detailed upfront planning
⚠️ Longer prompts to write
⚠️ May generate more code than needed
⚠️ Still requires human review

## When to Use

**Use for**:
- New features with clear requirements
- Boilerplate code
- Well-defined algorithms
- CRUD operations
- API endpoints
- Data transformations

**Be Cautious with**:
- Novel algorithms
- Complex business logic
- Performance-critical code
- Security-critical components

**Skip for**:
- Exploratory coding
- Unique architectural solutions
- Code requiring deep domain expertise

## Variations

### Minimal Version (Quick Prototyping)
```markdown
# Implement [Feature]
- Language: [X]
- Requirements: [Brief list]
- Include basic tests
```

### Test-Driven Version
```markdown
# Implement to Pass These Tests
[Provide tests first]
Please implement to make these tests pass
```

### Refactor-Focused Version
```markdown
# Improve Existing Code
Current code: [Paste code]
Issues: [List problems]
Please refactor to address these issues
```

## Related Patterns

- **Requirements Extraction**: Provides input specifications
- **Testing Pattern**: Generates accompanying tests
- **Refactoring Pattern**: Improves generated code

## Tips for Better Results

1. **Be Specific About Context**: Include actual project details
2. **Provide Examples**: Show existing similar code
3. **Set Quality Bar**: Explicitly state standards
4. **Request Tests**: Always ask for test cases
5. **Specify Error Handling**: Don't assume it will be included
6. **Review Critically**: AI code needs human review

## Common Issues and Solutions

### Issue: Generated Code Doesn't Follow Project Style
**Solution**: Provide style guide link or examples of existing code

### Issue: Missing Error Handling
**Solution**: Explicitly list error cases in prompt

### Issue: Incomplete Tests
**Solution**: Specify test scenarios and coverage goals

### Issue: Security Vulnerabilities
**Solution**: Include security requirements in prompt

## Next Steps

- Use this pattern for your next implementation task
- Adapt template for your tech stack
- Build library of successful prompts
- Share patterns that work well
