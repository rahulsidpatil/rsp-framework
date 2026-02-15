<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Testing Prompt Template

See detailed pattern at: [Testing Pattern](../../docs/03-patterns/prompt-patterns/testing.md)

## Quick Template

```markdown
# Generate Tests: [Component/Function Name]

## Code to Test
```[language]
[Paste implementation]
```

## Context
- **Testing framework**: [Jest, pytest, go test, etc.]
- **Current coverage**: [X%]
- **Target coverage**: [Y%]

## Test Requirements

### Test Types
- [ ] Unit tests
- [ ] Integration tests
- [ ] Edge case tests
- [ ] Error condition tests

### Specific Scenarios
1. Happy path: [Describe]
2. Edge case 1: [Describe]
3. Edge case 2: [Describe]
4. Error case 1: [Describe]
5. Error case 2: [Describe]

## Quality Requirements
- Descriptive test names
- Clear assertions
- Test isolation
- Proper mocking: [What needs mocks]
- Coverage goal: [X%]

## Please provide:
1. Comprehensive test suite
2. Test fixtures/data if needed
3. Setup/teardown code
4. Mocking where appropriate
5. Coverage analysis comments
```

For full details and examples, see the [Testing Pattern](../../docs/03-patterns/prompt-patterns/testing.md).
