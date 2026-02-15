<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Testing Pattern

## Intent
Generate comprehensive, high-quality test suites for code validation.

## Context
- Need tests for new code
- Improving test coverage
- Adding edge case tests
- TDD (test-driven development)
- Regression testing

## Problem
Writing thorough tests is time-consuming. Tests need to cover happy paths, edge cases, error conditions, and maintain high coverage.

## Solution
Use AI to generate comprehensive test suites with clear specifications of what needs to be tested.

### Template

```markdown
# Generate Tests: [Component/Function Name]

## Code to Test
```[language]
[Paste the implementation code]
```

## Context
- Testing framework: [Jest, pytest, Go test, etc.]
- Current coverage: [X%]
- Target coverage: [Y%]
- Critical paths: [What must be tested]

## Test Requirements

### Test Types Needed
- [ ] Unit tests
- [ ] Integration tests
- [ ] Edge case tests
- [ ] Error condition tests
- [ ] Performance tests

### Specific Scenarios
1. Happy path: [Describe]
2. Edge case 1: [Describe]
3. Edge case 2: [Describe]
4. Error case 1: [Describe]
5. Error case 2: [Describe]

### Test Data
[Describe test data needs or provide fixtures]

## Quality Requirements
- Test naming: Descriptive, follows [convention]
- Assertions: Clear and specific
- Setup/teardown: Proper test isolation
- Mocking: [What needs to be mocked]
- Coverage goal: [X%]

## Please provide:
1. Comprehensive test suite
2. Test fixtures/data if needed
3. Setup/teardown code
4. Mocking where appropriate
5. Coverage analysis comments
```

## Example

### Input Prompt

```markdown
# Generate Tests: UserService.createUser()

## Code to Test
```typescript
export class UserService {
  constructor(
    private db: Database,
    private emailService: EmailService
  ) {}

  async createUser(userData: CreateUserData): Promise<User> {
    // Validate email format
    if (!this.isValidEmail(userData.email)) {
      throw new ValidationError('Invalid email format');
    }

    // Check if user exists
    const existing = await this.db.users.findByEmail(userData.email);
    if (existing) {
      throw new ConflictError('User already exists');
    }

    // Hash password
    const passwordHash = await bcrypt.hash(userData.password, 10);

    // Create user
    const user = await this.db.users.create({
      email: userData.email,
      passwordHash,
      name: userData.name,
      createdAt: new Date(),
    });

    // Send welcome email
    await this.emailService.sendWelcome(user.email, user.name);

    return user;
  }

  private isValidEmail(email: string): boolean {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  }
}
```

## Context
- Testing framework: Jest with TypeScript
- Current coverage: 60%
- Target coverage: 90%
- Critical: Error handling, email validation, duplicate prevention

## Test Requirements

### Test Types Needed
- [x] Unit tests
- [x] Edge case tests
- [x] Error condition tests
- [ ] Integration tests (separate file)

### Specific Scenarios
1. Happy path: Valid user creation
2. Edge case: Email with special characters
3. Edge case: Long name
4. Error: Invalid email format
5. Error: Duplicate email
6. Error: Database failure
7. Error: Email service failure

### Test Data
Use realistic test data, mock database and email service

## Quality Requirements
- Test naming: "should [expected behavior] when [condition]"
- Mock external dependencies (db, emailService)
- Verify all error cases
- Check side effects (email sent)

## Please provide:
Complete test suite with all scenarios
```

### AI Response

```typescript
// __tests__/UserService.test.ts

import { UserService } from '../UserService';
import { Database } from '../Database';
import { EmailService } from '../EmailService';
import { ValidationError, ConflictError } from '../errors';
import bcrypt from 'bcrypt';

// Mock dependencies
jest.mock('bcrypt');
jest.mock('../Database');
jest.mock('../EmailService');

describe('UserService', () => {
  let userService: UserService;
  let mockDb: jest.Mocked<Database>;
  let mockEmailService: jest.Mocked<EmailService>;

  beforeEach(() => {
    // Reset mocks
    jest.clearAllMocks();

    // Setup mock database
    mockDb = {
      users: {
        findByEmail: jest.fn(),
        create: jest.fn(),
      },
    } as any;

    // Setup mock email service
    mockEmailService = {
      sendWelcome: jest.fn().mockResolvedValue(undefined),
    } as any;

    userService = new UserService(mockDb, mockEmailService);
  });

  describe('createUser - Happy Path', () => {
    it('should create user successfully with valid data', async () => {
      // Arrange
      const userData = {
        email: 'test@example.com',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      mockDb.users.findByEmail.mockResolvedValue(null);
      (bcrypt.hash as jest.Mock).mockResolvedValue('hashed_password');

      const expectedUser = {
        id: '123',
        email: userData.email,
        passwordHash: 'hashed_password',
        name: userData.name,
        createdAt: expect.any(Date),
      };
      mockDb.users.create.mockResolvedValue(expectedUser);

      // Act
      const result = await userService.createUser(userData);

      // Assert
      expect(result).toEqual(expectedUser);
      expect(mockDb.users.findByEmail).toHaveBeenCalledWith(userData.email);
      expect(bcrypt.hash).toHaveBeenCalledWith(userData.password, 10);
      expect(mockDb.users.create).toHaveBeenCalledWith({
        email: userData.email,
        passwordHash: 'hashed_password',
        name: userData.name,
        createdAt: expect.any(Date),
      });
      expect(mockEmailService.sendWelcome).toHaveBeenCalledWith(
        userData.email,
        userData.name
      );
    });

    it('should send welcome email after user creation', async () => {
      // Arrange
      const userData = {
        email: 'test@example.com',
        password: 'SecurePass123',
        name: 'Jane Doe',
      };

      mockDb.users.findByEmail.mockResolvedValue(null);
      (bcrypt.hash as jest.Mock).mockResolvedValue('hashed_password');
      mockDb.users.create.mockResolvedValue({
        id: '123',
        ...userData,
        passwordHash: 'hashed_password',
        createdAt: new Date(),
      } as any);

      // Act
      await userService.createUser(userData);

      // Assert
      expect(mockEmailService.sendWelcome).toHaveBeenCalledTimes(1);
      expect(mockEmailService.sendWelcome).toHaveBeenCalledWith(
        userData.email,
        userData.name
      );
    });
  });

  describe('createUser - Edge Cases', () => {
    it('should handle email with plus sign', async () => {
      const userData = {
        email: 'test+alias@example.com',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      mockDb.users.findByEmail.mockResolvedValue(null);
      (bcrypt.hash as jest.Mock).mockResolvedValue('hashed_password');
      mockDb.users.create.mockResolvedValue({
        id: '123',
        ...userData,
        passwordHash: 'hashed_password',
        createdAt: new Date(),
      } as any);

      const result = await userService.createUser(userData);

      expect(result.email).toBe(userData.email);
    });

    it('should handle very long names', async () => {
      const userData = {
        email: 'test@example.com',
        password: 'SecurePass123',
        name: 'A'.repeat(200), // Very long name
      };

      mockDb.users.findByEmail.mockResolvedValue(null);
      (bcrypt.hash as jest.Mock).mockResolvedValue('hashed_password');
      mockDb.users.create.mockResolvedValue({
        id: '123',
        ...userData,
        passwordHash: 'hashed_password',
        createdAt: new Date(),
      } as any);

      const result = await userService.createUser(userData);

      expect(result.name).toBe(userData.name);
    });
  });

  describe('createUser - Validation Errors', () => {
    it('should throw ValidationError for invalid email format', async () => {
      const userData = {
        email: 'invalid-email',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      await expect(userService.createUser(userData)).rejects.toThrow(
        ValidationError
      );
      await expect(userService.createUser(userData)).rejects.toThrow(
        'Invalid email format'
      );

      // Should not proceed to database operations
      expect(mockDb.users.findByEmail).not.toHaveBeenCalled();
      expect(mockDb.users.create).not.toHaveBeenCalled();
    });

    it('should throw ValidationError for empty email', async () => {
      const userData = {
        email: '',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      await expect(userService.createUser(userData)).rejects.toThrow(
        ValidationError
      );
    });

    it('should throw ValidationError for email without @ symbol', async () => {
      const userData = {
        email: 'testexample.com',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      await expect(userService.createUser(userData)).rejects.toThrow(
        ValidationError
      );
    });
  });

  describe('createUser - Conflict Errors', () => {
    it('should throw ConflictError when user already exists', async () => {
      const userData = {
        email: 'existing@example.com',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      // Mock existing user
      mockDb.users.findByEmail.mockResolvedValue({
        id: '456',
        email: userData.email,
        passwordHash: 'old_hash',
        name: 'Existing User',
        createdAt: new Date(),
      } as any);

      await expect(userService.createUser(userData)).rejects.toThrow(
        ConflictError
      );
      await expect(userService.createUser(userData)).rejects.toThrow(
        'User already exists'
      );

      // Should not proceed to create
      expect(mockDb.users.create).not.toHaveBeenCalled();
      expect(mockEmailService.sendWelcome).not.toHaveBeenCalled();
    });
  });

  describe('createUser - Database Errors', () => {
    it('should propagate database errors', async () => {
      const userData = {
        email: 'test@example.com',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      mockDb.users.findByEmail.mockRejectedValue(
        new Error('Database connection failed')
      );

      await expect(userService.createUser(userData)).rejects.toThrow(
        'Database connection failed'
      );
    });

    it('should propagate errors from user creation', async () => {
      const userData = {
        email: 'test@example.com',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      mockDb.users.findByEmail.mockResolvedValue(null);
      (bcrypt.hash as jest.Mock).mockResolvedValue('hashed_password');
      mockDb.users.create.mockRejectedValue(
        new Error('Constraint violation')
      );

      await expect(userService.createUser(userData)).rejects.toThrow(
        'Constraint violation'
      );

      // Email should not be sent if creation fails
      expect(mockEmailService.sendWelcome).not.toHaveBeenCalled();
    });
  });

  describe('createUser - Email Service Errors', () => {
    it('should propagate email service errors', async () => {
      const userData = {
        email: 'test@example.com',
        password: 'SecurePass123',
        name: 'John Doe',
      };

      mockDb.users.findByEmail.mockResolvedValue(null);
      (bcrypt.hash as jest.Mock).mockResolvedValue('hashed_password');
      mockDb.users.create.mockResolvedValue({
        id: '123',
        ...userData,
        passwordHash: 'hashed_password',
        createdAt: new Date(),
      } as any);

      mockEmailService.sendWelcome.mockRejectedValue(
        new Error('Email service unavailable')
      );

      await expect(userService.createUser(userData)).rejects.toThrow(
        'Email service unavailable'
      );
    });
  });
});

/*
 * Coverage Analysis:
 *
 * Lines covered:
 * - Email validation (happy path + multiple error cases)
 * - Existing user check (both null and found cases)
 * - Password hashing call
 * - User creation (success + error cases)
 * - Welcome email sending (success + error cases)
 *
 * Edge cases covered:
 * - Special characters in email
 * - Long names
 * - Various invalid email formats
 *
 * Error paths covered:
 * - Validation errors
 * - Conflict errors
 * - Database errors (multiple points)
 * - Email service errors
 *
 * Estimated coverage: ~95% of createUser method
 * Not covered: private isValidEmail method edge cases (could add separate tests)
 */
```

## Consequences

### Benefits
✅ Comprehensive test coverage
✅ Happy path, edge cases, and errors covered
✅ Proper mocking of dependencies
✅ Clear test organization
✅ Descriptive test names
✅ Fast execution (unit tests)

### Trade-offs
⚠️ Tests may need adjustment for real implementation details
⚠️ Mocking strategy might differ by project
⚠️ May generate more tests than strictly necessary

## When to Use

**Use for**:
- New code needing tests
- Improving coverage on existing code
- Adding edge case tests
- Regression test generation
- TDD (generate tests first)

**Best Results With**:
- Clear code to test
- Known edge cases
- Specific test requirements
- Modern testing frameworks

## Variations

### TDD Version (Tests First)
```markdown
# Generate TDD Tests
Requirements: [Feature spec]
Please generate tests defining expected behavior
Then I'll implement to pass the tests
```

### Integration Test Version
```markdown
# Generate Integration Tests
System: [Describe system]
Integration points: [List]
Test realistic workflows end-to-end
```

### Performance Test Version
```markdown
# Generate Performance Tests
Code: [Paste]
Performance requirements: [Specify]
Generate load/stress tests
```

## Related Patterns

- **Code Generation**: Generate code to pass tests
- **Refactoring**: Write tests before refactoring
- **Validation Patterns**: Tests are key validation

## Tips for Success

1. **Specify Framework**: Different frameworks have different patterns
2. **List Edge Cases**: Don't rely on AI to think of all edge cases
3. **Define Coverage Goals**: Be explicit about what needs testing
4. **Review Tests**: Ensure tests actually validate correctness
5. **Run Tests**: Verify generated tests actually pass
6. **Add Human Insight**: Supplement AI tests with domain-specific cases

## Common Issues

### Issue: Tests Don't Compile
**Solution**: Provide correct types and imports in prompt

### Issue: Tests Are Too Simplistic
**Solution**: Specify edge cases and error conditions explicitly

### Issue: Over-Mocking
**Solution**: Clarify what should be mocked vs tested

### Issue: Tests Pass but Don't Validate Correctness
**Solution**: Review assertions carefully, add more specific checks

## Next Steps

- Use this pattern for your next testing task
- Build library of test prompts for common patterns
- Combine with TDD workflow
- Share effective test generation strategies
