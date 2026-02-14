# Refactoring Pattern

## Intent
Systematically improve code quality, maintainability, and performance while preserving functionality.

## Context
- Code smells identified
- Performance issues
- Maintainability concerns
- Preparing for new features
- Technical debt reduction

## Problem
Refactoring requires understanding existing code, identifying issues, and carefully improving without breaking functionality. Manual refactoring is time-consuming and risky.

## Solution
Use AI to analyze code, propose improvements, and execute refactoring with comprehensive validation.

### Template

```markdown
# Refactor: [Component/Module Name]

## Current Code
```[language]
[Paste the code to refactor]
```

## Context
- Purpose: [What this code does]
- Usage: [How it's used in the system]
- Constraints: [What can't change - APIs, behavior, etc.]
- Tech stack: [Relevant technologies]

## Issues Identified
1. [Issue 1 - e.g., "Complex nested conditionals"]
2. [Issue 2 - e.g., "Duplicated logic"]
3. [Issue 3 - e.g., "Poor naming"]

## Refactoring Goals
Primary goals:
- [ ] [Goal 1 - e.g., "Improve readability"]
- [ ] [Goal 2 - e.g., "Reduce complexity"]
- [ ] [Goal 3 - e.g., "Better error handling"]

## Requirements
- Preserve existing functionality exactly
- Maintain backward compatibility
- Follow [style guide/conventions]
- Improve test coverage to [X%]

## Please provide:
1. Analysis of current code issues
2. Proposed refactoring approach
3. Refactored code
4. Explanation of changes
5. Updated/new tests
6. Migration notes (if needed)
```

## Example

### Input Prompt

```markdown
# Refactor: User Validation Function

## Current Code
```typescript
function validateUser(user: any) {
  if (!user) return false;
  if (!user.email || user.email.length === 0) return false;
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(user.email)) return false;
  if (!user.password) return false;
  if (user.password.length < 8) return false;
  if (!/[A-Z]/.test(user.password)) return false;
  if (!/[a-z]/.test(user.password)) return false;
  if (!/[0-9]/.test(user.password)) return false;
  if (user.age && (user.age < 13 || user.age > 120)) return false;
  return true;
}
```

## Context
- Purpose: Validates user input before account creation
- Usage: Called in registration API endpoint
- Constraints: Cannot change function signature or return type
- Tech stack: TypeScript, Express.js

## Issues Identified
1. Poor error messages - returns only true/false
2. Complex nested validation logic
3. Weak typing (user: any)
4. Hard-coded validation rules
5. No extensibility

## Refactoring Goals
Primary goals:
- [x] Return detailed validation errors
- [x] Extract validation rules
- [x] Strong typing
- [x] Better maintainability

## Requirements
- Preserve core validation logic
- Backward compatible with current callers
- Follow TypeScript best practices
- Include comprehensive tests

## Please provide:
1. Analysis
2. Refactored code
3. Tests
4. Usage examples
```

### AI Response (Excerpt)

```typescript
// types.ts
interface User {
  email: string;
  password: string;
  age?: number;
}

interface ValidationError {
  field: string;
  message: string;
  rule: string;
}

interface ValidationResult {
  isValid: boolean;
  errors: ValidationError[];
}

// validators.ts
type ValidatorFn = (value: any) => ValidationError | null;

const emailValidator: ValidatorFn = (email: string) => {
  if (!email || email.length === 0) {
    return {
      field: 'email',
      message: 'Email is required',
      rule: 'required'
    };
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return {
      field: 'email',
      message: 'Email format is invalid',
      rule: 'format'
    };
  }

  return null;
};

const passwordValidator: ValidatorFn = (password: string) => {
  if (!password) {
    return {
      field: 'password',
      message: 'Password is required',
      rule: 'required'
    };
  }

  const rules = [
    { test: (p: string) => p.length >= 8, message: 'Password must be at least 8 characters' },
    { test: (p: string) => /[A-Z]/.test(p), message: 'Password must contain an uppercase letter' },
    { test: (p: string) => /[a-z]/.test(p), message: 'Password must contain a lowercase letter' },
    { test: (p: string) => /[0-9]/.test(p), message: 'Password must contain a number' },
  ];

  for (const rule of rules) {
    if (!rule.test(password)) {
      return {
        field: 'password',
        message: rule.message,
        rule: 'format'
      };
    }
  }

  return null;
};

const ageValidator: ValidatorFn = (age?: number) => {
  if (age === undefined) return null;

  if (age < 13 || age > 120) {
    return {
      field: 'age',
      message: 'Age must be between 13 and 120',
      rule: 'range'
    };
  }

  return null;
};

// userValidator.ts
export class UserValidator {
  validate(user: User): ValidationResult {
    const errors: ValidationError[] = [];

    if (!user) {
      return {
        isValid: false,
        errors: [{
          field: 'user',
          message: 'User object is required',
          rule: 'required'
        }]
      };
    }

    // Run all validators
    const validators = [
      () => emailValidator(user.email),
      () => passwordValidator(user.password),
      () => ageValidator(user.age),
    ];

    for (const validator of validators) {
      const error = validator();
      if (error) {
        errors.push(error);
      }
    }

    return {
      isValid: errors.length === 0,
      errors
    };
  }

  // Backward compatible wrapper
  validateLegacy(user: any): boolean {
    return this.validate(user).isValid;
  }
}

// Export for backward compatibility
export function validateUser(user: any): boolean {
  const validator = new UserValidator();
  return validator.validateLegacy(user);
}

// New recommended usage
export function validateUserDetailed(user: User): ValidationResult {
  const validator = new UserValidator();
  return validator.validate(user);
}
```

```typescript
// __tests__/userValidator.test.ts
import { UserValidator, validateUser, validateUserDetailed } from '../userValidator';

describe('UserValidator', () => {
  let validator: UserValidator;

  beforeEach(() => {
    validator = new UserValidator();
  });

  describe('validate', () => {
    it('should pass for valid user', () => {
      const user = {
        email: 'test@example.com',
        password: 'SecurePass123'
      };

      const result = validator.validate(user);

      expect(result.isValid).toBe(true);
      expect(result.errors).toHaveLength(0);
    });

    it('should fail for missing email', () => {
      const user = {
        email: '',
        password: 'SecurePass123'
      };

      const result = validator.validate(user);

      expect(result.isValid).toBe(false);
      expect(result.errors).toContainEqual({
        field: 'email',
        message: 'Email is required',
        rule: 'required'
      });
    });

    it('should provide multiple error messages', () => {
      const user = {
        email: 'invalid-email',
        password: 'weak'
      };

      const result = validator.validate(user);

      expect(result.isValid).toBe(false);
      expect(result.errors.length).toBeGreaterThan(1);
    });

    // More tests...
  });

  describe('backward compatibility', () => {
    it('validateUser should work as before', () => {
      expect(validateUser({
        email: 'test@example.com',
        password: 'SecurePass123'
      })).toBe(true);

      expect(validateUser({
        email: 'invalid',
        password: 'weak'
      })).toBe(false);
    });
  });
});
```

## Consequences

### Benefits
✅ Improved code quality
✅ Better error messages
✅ Easier to maintain and extend
✅ Strongly typed
✅ Backward compatible
✅ Well-tested

### Trade-offs
⚠️ More code (but better organized)
⚠️ Requires refactoring callers for full benefits
⚠️ Learning curve for new structure

## When to Use

**Use for**:
- Code with identified smells
- Complex functions (> 20 lines)
- Duplicated logic
- Difficult to test code
- Performance bottlenecks
- Poor naming or structure

**Skip for**:
- Simple, clear code
- Recently refactored code
- Code without tests (write tests first)
- Mission-critical code under active development

## Variations

### Quick Cleanup
```markdown
# Quick Refactor
Current code: [paste]
Issues: [list 1-2 main issues]
Please: Improve readability, preserve functionality
```

### Performance-Focused
```markdown
# Optimize Performance
Current code: [paste]
Performance issue: [describe bottleneck]
Target: [performance goal]
Please: Optimize while maintaining correctness
```

### Test-First Refactoring
```markdown
# Refactor with Tests
Current code: [paste]
First: Generate comprehensive tests
Then: Refactor safely with tests passing
```

## Related Patterns

- **Testing Pattern**: Write tests before refactoring
- **Code Generation**: Generate improved version
- **Validation Patterns**: Ensure refactored code quality

## Tips for Success

1. **Write Tests First**: Ensure tests pass before and after
2. **Small Steps**: Refactor incrementally
3. **Review Carefully**: Understand all changes
4. **Preserve Behavior**: Don't change functionality
5. **Update Documentation**: Keep docs in sync
6. **Communicate**: Inform team of structural changes

## Common Issues

### Issue: Refactoring Breaks Tests
**Solution**: Ensure comprehensive tests exist first

### Issue: Over-Engineering
**Solution**: Focus on specific issues, don't redesign everything

### Issue: Lost Functionality
**Solution**: Validate behavior preservation thoroughly

## Next Steps

- Identify code to refactor in your project
- Use this pattern for systematic improvement
- Build confidence through small refactorings
- Share successful refactorings with team
