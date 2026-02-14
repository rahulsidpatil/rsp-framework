# Testing AI-Generated Code

## Overview

Systematic testing is crucial for validating AI-generated code and ensuring quality, security, and correctness.

## Why Testing Matters for AI Code

### Unique Challenges
- AI may produce syntactically correct but logically flawed code
- Edge cases might be missed
- Security vulnerabilities may be introduced
- Performance issues may not be apparent

### The Solution
Multi-layered testing strategy specifically designed for AI-generated artifacts.

## Testing Layers

### 1. Automated Testing
**Unit Tests**
- Test individual functions and methods
- Verify edge cases
- Check error handling

**Integration Tests**
- Test component interactions
- Verify data flow
- Check external dependencies

**End-to-End Tests**
- Test complete workflows
- Verify user scenarios
- Check system behavior

### 2. Static Analysis
**Linting**
- Code style conformance
- Common antipatterns
- Best practice violations

**Type Checking**
- Type safety (TypeScript, mypy, etc.)
- Interface contracts
- Type inference correctness

**Security Scanning**
- Known vulnerabilities
- Security antipatterns
- Dependency issues

### 3. Code Review
**Human Review**
- Logic correctness
- Architecture alignment
- Code quality
- Security considerations

### 4. Performance Testing
- Benchmarks
- Load testing
- Resource usage
- Scalability checks

## Testing Strategy for AI Code

### Pre-Generation Testing
**Prompt Validation**
```markdown
## Prompt Checklist
- [ ] Clear success criteria defined
- [ ] Edge cases specified
- [ ] Security requirements stated
- [ ] Performance expectations set
- [ ] Test requirements included in prompt
```

### Post-Generation Testing

**Immediate Validation**
1. Does it compile/run?
2. Does it follow project conventions?
3. Are imports correct?
4. Are types consistent?

**Functional Validation**
1. Run existing tests
2. Add new tests for new functionality
3. Test edge cases
4. Test error conditions

**Security Validation**
1. Input validation
2. Authentication/authorization
3. Data sanitization
4. Dependency vulnerabilities

**Performance Validation**
1. Run benchmarks
2. Check resource usage
3. Test scalability
4. Verify efficiency

## Testing Patterns

### Pattern 1: Test-Driven AI Development

1. **Define tests first**
```javascript
// tests/auth.test.js
describe('Authentication', () => {
    test('should hash passwords securely', () => {
        const password = 'test123';
        const hashed = hashPassword(password);
        expect(hashed).not.toBe(password);
        expect(verifyPassword(password, hashed)).toBe(true);
    });
});
```

2. **Prompt AI with test requirements**
```markdown
# Generate Password Hashing Function

## Requirements
- Use bcrypt for hashing
- Salt rounds: 10
- Must pass the provided test cases

## Tests
See tests/auth.test.js for required behavior
```

3. **Validate and iterate**

### Pattern 2: AI + Human Pair Testing

1. **AI generates code**
2. **AI generates initial tests**
3. **Human adds edge case tests**
4. **Iterate until all tests pass**

### Pattern 3: Incremental Validation

```markdown
# Implementation Plan
1. Generate core logic + tests ✓
2. Add error handling + tests ✓
3. Add edge cases + tests ✓
4. Performance optimization + benchmarks ✓
5. Security review + security tests ✓
```

## Test Coverage for AI Code

### Minimum Coverage
- **Unit tests**: 80% code coverage
- **Integration tests**: Critical paths
- **Security tests**: All input points
- **Edge cases**: Known failure modes

### Test Types

**Happy Path Tests**
```javascript
test('creates user successfully', async () => {
    const user = await createUser({
        email: 'test@example.com',
        password: 'secure123'
    });
    expect(user).toBeDefined();
    expect(user.email).toBe('test@example.com');
});
```

**Edge Case Tests**
```javascript
test('handles duplicate email gracefully', async () => {
    await createUser({ email: 'test@example.com', password: 'pass1' });
    await expect(
        createUser({ email: 'test@example.com', password: 'pass2' })
    ).rejects.toThrow('Email already exists');
});
```

**Security Tests**
```javascript
test('prevents SQL injection', async () => {
    const maliciousInput = "'; DROP TABLE users; --";
    await expect(
        getUser(maliciousInput)
    ).rejects.toThrow();
});
```

**Performance Tests**
```javascript
test('handles 1000 concurrent requests', async () => {
    const start = Date.now();
    const requests = Array(1000).fill().map(() => apiCall());
    await Promise.all(requests);
    const duration = Date.now() - start;
    expect(duration).toBeLessThan(5000); // 5 seconds
});
```

## Automated Validation Pipeline

### CI/CD Integration

```yaml
# .github/workflows/ai-code-validation.yml
name: AI Code Validation

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Run Unit Tests
        run: npm test

      - name: Check Coverage
        run: npm run test:coverage
        # Fail if coverage < 80%

      - name: Lint Code
        run: npm run lint

      - name: Type Check
        run: npm run type-check

      - name: Security Scan
        run: npm audit

      - name: Performance Benchmarks
        run: npm run benchmark
```

### Quality Gates

```javascript
// quality-gates.config.js
module.exports = {
    coverage: {
        statements: 80,
        branches: 75,
        functions: 80,
        lines: 80
    },
    security: {
        allowedSeverity: ['low'],
        failOn: ['medium', 'high', 'critical']
    },
    performance: {
        maxResponseTime: 200, // ms
        maxMemoryUsage: 100   // MB
    }
};
```

## Code Review Checklist for AI Code

### Functionality
- [ ] Meets requirements
- [ ] Handles edge cases
- [ ] Error handling is appropriate
- [ ] No obvious bugs

### Code Quality
- [ ] Follows project conventions
- [ ] Well-structured and readable
- [ ] Appropriate abstractions
- [ ] No code duplication

### Security
- [ ] Input validation present
- [ ] No SQL injection risks
- [ ] No XSS vulnerabilities
- [ ] Authentication/authorization correct
- [ ] Secrets not hardcoded

### Performance
- [ ] Efficient algorithms
- [ ] No obvious performance issues
- [ ] Resources properly managed
- [ ] Scales appropriately

### Testing
- [ ] Tests included
- [ ] Tests are comprehensive
- [ ] Edge cases covered
- [ ] Tests actually pass

### Documentation
- [ ] Code is self-documenting or commented
- [ ] Complex logic explained
- [ ] API documented if applicable

## Testing Tools

### JavaScript/TypeScript
- **Jest**: Unit and integration testing
- **Cypress**: E2E testing
- **ESLint**: Linting
- **TypeScript**: Type checking
- **npm audit**: Security scanning

### Python
- **pytest**: Unit testing
- **pylint**: Linting
- **mypy**: Type checking
- **bandit**: Security scanning
- **locust**: Load testing

### Go
- **go test**: Built-in testing
- **golangci-lint**: Linting
- **gosec**: Security scanning
- **vegeta**: Load testing

### Multi-Language
- **SonarQube**: Code quality
- **Snyk**: Security scanning
- **Dependabot**: Dependency updates

## Best Practices

### DO
✅ Test AI code more thoroughly than human code
✅ Include security tests for all input points
✅ Automate validation in CI/CD
✅ Set clear quality gates
✅ Review AI-generated tests critically

### DON'T
❌ Trust AI-generated code without validation
❌ Skip edge case testing
❌ Ignore security scanning results
❌ Accept AI-generated tests without review
❌ Bypass quality gates for AI code

## Measuring Testing Effectiveness

### Metrics
- Test coverage percentage
- Number of bugs found in review
- Security vulnerabilities detected
- Performance regression incidents
- Time to validate AI code

### Success Indicators
- Consistently high test coverage
- Few bugs escape to production
- Security scans pass
- Performance meets requirements
- Fast validation cycle

## Common Issues and Solutions

### Issue: AI Generates Tests That Don't Cover Edge Cases
**Solution**: Explicitly specify edge cases in prompt

### Issue: Tests Pass but Code Has Logic Errors
**Solution**: Review tests carefully, add property-based tests

### Issue: AI Code Fails Security Scans
**Solution**: Include security requirements in prompt, use secure coding guidelines

### Issue: Performance Issues Not Caught
**Solution**: Add performance benchmarks, set thresholds

## Next Steps

- Implement testing checklist for your project
- Set up automated validation pipeline
- Create prompt templates with test requirements
- Explore [Validation Patterns](../../03-patterns/validation-patterns/README.md)
- Review [Code Review best practices](../../04-practices/code-review.md)
