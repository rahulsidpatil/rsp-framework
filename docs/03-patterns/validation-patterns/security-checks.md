# Security Checks for AI-Generated Code

## Intent
Systematic security validation to prevent vulnerabilities in AI-generated code.

## Context
All AI-generated code, especially:
- User input handling
- Authentication/authorization
- Data storage and retrieval
- External API interactions
- File operations

## Problem
AI models may generate insecure code patterns, miss security best practices, or introduce common vulnerabilities like OWASP Top 10 issues.

## Solution
Multi-layered security validation combining automated tools and manual review.

## Security Checklist

### 1. Input Validation ✓
- [ ] All user inputs validated
- [ ] Type checking enforced
- [ ] Length/size limits applied
- [ ] Format validation (email, URL, etc.)
- [ ] Whitelist approach used where possible
- [ ] Sanitization applied before use

### 2. Authentication & Authorization ✓
- [ ] Authentication required where needed
- [ ] Authorization checks present
- [ ] No authentication bypass possible
- [ ] Session management secure
- [ ] Password handling secure (hashing, salting)
- [ ] No hardcoded credentials

### 3. Injection Prevention ✓
- [ ] No SQL injection vulnerabilities
- [ ] Parameterized queries used
- [ ] No command injection risks
- [ ] No LDAP injection
- [ ] No XML injection
- [ ] Template injection prevented

### 4. XSS Prevention ✓
- [ ] User input escaped on output
- [ ] Content Security Policy considered
- [ ] No innerHTML with user data
- [ ] HTML sanitization where needed

### 5. Sensitive Data Protection ✓
- [ ] Passwords hashed (bcrypt/Argon2)
- [ ] Sensitive data encrypted at rest
- [ ] TLS/HTTPS enforced
- [ ] No logging of sensitive data
- [ ] PII handled appropriately
- [ ] API keys/secrets in environment variables

### 6. Error Handling ✓
- [ ] No sensitive data in error messages
- [ ] Stack traces not exposed in production
- [ ] Generic error messages to users
- [ ] Detailed errors logged securely

### 7. Dependencies ✓
- [ ] No known vulnerable dependencies
- [ ] Dependencies up to date
- [ ] Minimal dependencies used
- [ ] Dependencies from trusted sources

## Common Vulnerabilities in AI Code

### 1. SQL Injection
**Bad (AI might generate)**:
```javascript
const query = `SELECT * FROM users WHERE email = '${userEmail}'`;
db.query(query);
```

**Good**:
```javascript
const query = 'SELECT * FROM users WHERE email = ?';
db.query(query, [userEmail]);
```

### 2. Command Injection
**Bad**:
```javascript
exec(`convert ${userFilename} output.png`);
```

**Good**:
```javascript
const { execFile } = require('child_process');
execFile('convert', [userFilename, 'output.png']);
```

### 3. Missing Auth Checks
**Bad**:
```javascript
app.delete('/api/users/:id', async (req, res) => {
  await db.users.delete(req.params.id);
  res.json({ success: true });
});
```

**Good**:
```javascript
app.delete('/api/users/:id', authMiddleware, async (req, res) => {
  // Check if user can delete this user
  if (req.user.id !== req.params.id && !req.user.isAdmin) {
    return res.status(403).json({ error: 'Forbidden' });
  }
  await db.users.delete(req.params.id);
  res.json({ success: true });
});
```

### 4. Insecure Password Storage
**Bad**:
```javascript
// AI might use MD5 or plain text
const hash = md5(password);
```

**Good**:
```javascript
const bcrypt = require('bcrypt');
const hash = await bcrypt.hash(password, 10);
```

### 5. XSS Vulnerability
**Bad**:
```javascript
element.innerHTML = userInput;
```

**Good**:
```javascript
element.textContent = userInput;
// Or use a sanitization library
```

## Automated Security Tools

### JavaScript/TypeScript
```bash
# npm audit
npm audit
npm audit fix

# Snyk
snyk test
snyk monitor

# ESLint security plugin
npm install --save-dev eslint-plugin-security
```

### Python
```bash
# Bandit
bandit -r src/

# Safety
safety check

# pip-audit
pip-audit
```

### Go
```bash
# Gosec
gosec ./...

# Go vulnerability check
govulncheck ./...
```

### Multi-Language
```bash
# Semgrep
semgrep --config=auto

# Trivy (for containers and dependencies)
trivy fs .
```

## Security Review Process

### Step 1: Automated Scanning
```yaml
# .github/workflows/security.yml
name: Security Checks

on: [push, pull_request]

jobs:
  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Run Snyk
        run: npm install -g snyk && snyk test

      - name: Run npm audit
        run: npm audit --audit-level=moderate

      - name: Run Semgrep
        uses: returntocorp/semgrep-action@v1
```

### Step 2: Manual Review
Use security checklist above

### Step 3: Penetration Testing
For critical features:
- Manual security testing
- Automated pen-testing tools
- Security team review

## Security in Prompts

### Include Security Requirements

```markdown
# Generate Login Endpoint

## Security Requirements
- Use bcrypt for password hashing (10 rounds)
- Implement rate limiting (5 attempts per 15 min)
- Input validation on all fields
- No sensitive data in logs
- Use parameterized queries
- Return generic error messages

## Implementation
[Rest of prompt]
```

## Secure Coding Guidelines for AI

### Authentication
- Always hash passwords (bcrypt, Argon2)
- Use secure session management
- Implement MFA where appropriate
- Token expiry and refresh

### Input Handling
- Validate all inputs
- Sanitize before use
- Use allowlists not denylists
- Check types, lengths, formats

### Database
- Use parameterized queries/ORMs
- Principle of least privilege
- Encrypt sensitive data
- No credentials in code

### APIs
- Rate limiting
- Authentication required
- Authorization checks
- HTTPS only
- CORS configured properly

### File Operations
- Validate file types
- Limit file sizes
- Sanitize filenames
- Store outside web root

## Security Testing

### Test Cases to Include

```javascript
describe('Security Tests', () => {
  test('prevents SQL injection', async () => {
    const maliciousInput = "'; DROP TABLE users; --";
    await expect(
      userService.findByEmail(maliciousInput)
    ).not.toThrow();
    // Verify no SQL was executed
  });

  test('requires authentication', async () => {
    const response = await request(app)
      .get('/api/protected')
      .expect(401);
  });

  test('prevents unauthorized access', async () => {
    const response = await request(app)
      .delete('/api/users/other-user-id')
      .set('Authorization', `Bearer ${userToken}`)
      .expect(403);
  });

  test('sanitizes user input', async () => {
    const xssInput = '<script>alert("xss")</script>';
    const result = await userService.updateProfile({ bio: xssInput });
    expect(result.bio).not.toContain('<script>');
  });
});
```

## Security Incident Response

### If Vulnerability Found

1. **Assess Severity**: Critical, High, Medium, Low
2. **Document**: What, where, how, impact
3. **Fix**: Patch immediately
4. **Test**: Verify fix works
5. **Deploy**: Priority deployment
6. **Learn**: Update prompts/guidelines
7. **Notify**: If customer data affected

## Metrics

Track:
- Vulnerabilities found (by type, severity)
- Time to detection
- Time to fix
- Scan coverage
- False positive rate

## Best Practices

### DO
✅ Run automated scans on all code
✅ Manual review for sensitive code
✅ Include security in prompts
✅ Test security scenarios
✅ Update dependencies regularly
✅ Learn from findings

### DON'T
❌ Trust AI to handle security
❌ Skip automated scanning
❌ Ignore security warnings
❌ Hardcode secrets
❌ Disable security features for convenience
❌ Use deprecated crypto

## Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP Cheat Sheets](https://cheatsheetseries.owasp.org/)
- [CWE Top 25](https://cwe.mitre.org/top25/)
- Security-specific linters and scanners

## Next Steps

- Set up automated security scanning
- Review existing AI code for vulnerabilities
- Update prompts to include security requirements
- Train team on secure coding for AI
- Establish security review process
