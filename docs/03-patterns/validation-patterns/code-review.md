<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Code Review Pattern for AI-Generated Code

## Intent
Systematic code review process specifically designed for validating AI-generated code.

## Context
- AI-generated code going to production
- Team code review workflows
- Quality assurance processes
- Learning and improvement

## Problem
AI-generated code may contain subtle bugs, security issues, or architectural problems that aren't caught by automated tools. Standard code review processes may not address AI-specific concerns.

## Solution
Enhanced code review process that addresses both traditional concerns and AI-specific issues.

## Code Review Checklist

### 1. Functionality ✓
**Does the code actually work?**

- [ ] Code compiles/runs without errors
- [ ] Meets stated requirements
- [ ] Handles happy path correctly
- [ ] Edge cases are addressed
- [ ] Error conditions handled appropriately
- [ ] No obvious logic errors

**Questions to Ask**:
- Does this do what was requested?
- Are there cases this won't handle?
- What could go wrong?

---

### 2. Correctness ✓
**Is the logic sound?**

- [ ] Algorithms are correct
- [ ] Data transformations are accurate
- [ ] Calculations are precise
- [ ] Conditionals are logical
- [ ] Loops terminate correctly
- [ ] No off-by-one errors

**AI-Specific Concerns**:
- AI may generate syntactically correct but logically flawed code
- Double-check complex logic
- Verify assumptions

---

### 3. Security ✓
**Is the code secure?**

- [ ] Input validation present
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] No command injection risks
- [ ] Sensitive data protected
- [ ] Authentication/authorization correct
- [ ] No hardcoded secrets
- [ ] Safe deserialization
- [ ] CSRF protection where needed
- [ ] Rate limiting considered

**AI-Specific Concerns**:
- AI may not prioritize security
- Always check security manually
- Use automated scanners too

---

### 4. Performance ✓
**Will this perform well?**

- [ ] No obvious performance issues
- [ ] Efficient algorithms (not O(n²) when O(n) possible)
- [ ] Database queries optimized
- [ ] No N+1 query problems
- [ ] Resource usage reasonable
- [ ] Scalability considered

**Questions**:
- How will this perform at scale?
- Are there bottlenecks?
- Could this be optimized?

---

### 5. Code Quality ✓
**Is this maintainable?**

- [ ] Follows project conventions
- [ ] Naming is clear and consistent
- [ ] Functions are appropriately sized
- [ ] Code is DRY (no unnecessary duplication)
- [ ] Appropriate abstractions
- [ ] Comments where needed (but not excessive)
- [ ] No dead code
- [ ] Proper error messages

**AI-Specific Concerns**:
- AI may use inconsistent naming
- AI may over-comment or under-comment
- Check against project style guide

---

### 6. Testing ✓
**Is there adequate test coverage?**

- [ ] Tests are included
- [ ] Tests actually test the right things
- [ ] Coverage meets requirements (typically 80%+)
- [ ] Edge cases tested
- [ ] Error cases tested
- [ ] Tests are independent
- [ ] Tests are deterministic
- [ ] Test names are descriptive

**AI-Specific Concerns**:
- AI-generated tests may be superficial
- Verify tests actually validate behavior
- Add missing test cases

---

### 7. Architecture ✓
**Does this fit the system?**

- [ ] Follows established patterns
- [ ] Integrates properly with existing code
- [ ] Dependencies are appropriate
- [ ] No circular dependencies
- [ ] Separation of concerns maintained
- [ ] SOLID principles followed

**Questions**:
- Does this belong here?
- Is this the right abstraction?
- Will this be easy to change later?

---

### 8. Documentation ✓
**Is it documented appropriately?**

- [ ] Public APIs documented
- [ ] Complex logic explained
- [ ] Non-obvious decisions noted
- [ ] Usage examples provided (if library code)
- [ ] README updated if needed
- [ ] Changelog updated

**AI-Specific Concerns**:
- AI documentation may be generic
- Ensure docs match actual behavior
- Add domain-specific context

---

## Review Process

### Step 1: Automated Checks
Run before human review:
```bash
npm run lint        # Style check
npm test            # Run tests
npm run security    # Security scan
npm run type-check  # Type validation
```

### Step 2: Self-Review
**Author checks their own AI-generated code**:
- Read through entire change
- Run code locally
- Verify behavior
- Check against requirements
- Update based on findings

### Step 3: Peer Review
**Team member reviews**:
- Use checklist above
- Leave constructive comments
- Ask questions for clarification
- Suggest improvements
- Approve when satisfied

### Step 4: Address Feedback
- Iterate on feedback
- Re-prompt AI if needed
- Make manual adjustments
- Re-run validation

### Step 5: Final Approval
- All checks passing
- Feedback addressed
- Ready for merge

## Review Levels

### Level 1: Light Review (10-15 min)
**For**: Small changes, low-risk code

- Quick functionality check
- Run automated tools
- Spot-check for obvious issues

### Level 2: Standard Review (30-45 min)
**For**: Most code changes

- Full checklist review
- Thorough testing
- Security review
- Code quality check

### Level 3: Deep Review (1-2 hours)
**For**: Critical code, complex features

- Comprehensive analysis
- Multiple reviewers
- Security expert review
- Architecture review
- Performance analysis

## Common Issues in AI Code

### Issue: Over-Engineering
**Symptom**: More complex than needed

**Solution**: Simplify, ask for minimal viable solution

### Issue: Under-Engineering
**Symptom**: Missing error handling, validation

**Solution**: Explicitly request these in prompt

### Issue: Copy-Paste from Training Data
**Symptom**: Includes irrelevant comments, different style

**Solution**: Review carefully, remove inconsistencies

### Issue: Plausible but Wrong
**Symptom**: Looks right but has subtle bugs

**Solution**: Test thoroughly, verify logic

### Issue: Security Gaps
**Symptom**: Missing input validation, auth checks

**Solution**: Security checklist, automated scanning

## Pull Request Template for AI Code

```markdown
## Description
[What this does]

## AI Usage
- **AI Tool**: Claude / Copilot / etc.
- **Prompt**: Link to prompt file or description
- **Human Review**: [Describe what you reviewed/changed]
- **Manual Modifications**: [List any manual changes]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Refactoring
- [ ] Documentation

## AI Code Review Checklist
- [ ] Functionality verified
- [ ] Security reviewed
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Performance considered
- [ ] Follows project conventions

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed
- [ ] Edge cases verified

## Additional Context
[Anything reviewers should know]
```

## Tools for Review

### Automated Tools
- **Linters**: ESLint, pylint, golangci-lint
- **Type Checkers**: TypeScript, mypy, Flow
- **Security**: Snyk, Bandit, gosec
- **Testing**: Jest, pytest, go test
- **Coverage**: nyc, coverage.py, go cover

### Manual Review
- **GitHub/GitLab**: PR reviews with comments
- **Pair Review**: Screen sharing
- **Asynchronous**: Written comments

## Metrics

Track to improve:
- Issues found in review
- Time to review
- Review cycles needed
- Bugs escaping to production

## Tips for Reviewers

1. **Be Constructive**: Suggest improvements, don't just criticize
2. **Ask Questions**: Understand intent before judging
3. **Consider Context**: Not every rule applies everywhere
4. **Focus on Impact**: Prioritize critical issues
5. **Learn Together**: Use reviews as teaching moments

## Tips for Authors

1. **Self-Review First**: Don't waste reviewer time on obvious issues
2. **Provide Context**: Explain AI prompts and decisions
3. **Be Responsive**: Address feedback promptly
4. **Ask for Clarification**: If feedback is unclear
5. **Iterate**: Multiple review rounds are normal

## Next Steps

- Implement code review process for your team
- Create project-specific checklist
- Train team on AI code review
- Track metrics and improve
