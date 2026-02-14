# Code Review Checklist for AI-Generated Code

See full pattern at: [Code Review Pattern](../../docs/03-patterns/validation-patterns/code-review.md)

## Quick Checklist

### Functionality ✓
- [ ] Code compiles/runs without errors
- [ ] Meets stated requirements
- [ ] Handles happy path correctly
- [ ] Edge cases are addressed
- [ ] Error conditions handled
- [ ] No obvious logic errors

### Security ✓
- [ ] Input validation present
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] No command injection risks
- [ ] Sensitive data protected
- [ ] Authentication/authorization correct
- [ ] No hardcoded secrets

### Code Quality ✓
- [ ] Follows project conventions
- [ ] Naming is clear and consistent
- [ ] Functions are appropriately sized
- [ ] No unnecessary duplication
- [ ] Appropriate abstractions
- [ ] Well-documented

### Testing ✓
- [ ] Tests are included
- [ ] Tests are comprehensive
- [ ] Coverage meets requirements (80%+)
- [ ] Edge cases tested
- [ ] Error cases tested

### Performance ✓
- [ ] No obvious performance issues
- [ ] Efficient algorithms
- [ ] Database queries optimized
- [ ] Resource usage reasonable

### Architecture ✓
- [ ] Follows established patterns
- [ ] Integrates properly with existing code
- [ ] Dependencies are appropriate
- [ ] Separation of concerns maintained

## For Full Details

See [Code Review Pattern](../../docs/03-patterns/validation-patterns/code-review.md) for comprehensive guidance, examples, and best practices.
