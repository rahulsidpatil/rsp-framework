<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Security Policy

## Reporting a Vulnerability

The RSP Framework is primarily a documentation and methodology project. However, if you discover a security vulnerability in any scripts, examples, or tooling, please report it responsibly.

### How to Report

1. **Do NOT** open a public issue for security vulnerabilities
2. Email the maintainers or use GitHub's private vulnerability reporting feature
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### What to Report

Please report:
- Security issues in scripts (e.g., `tools/scripts/*.sh`)
- Vulnerable dependencies in workflows
- Insecure code examples that could mislead users
- XSS or injection vulnerabilities in example code
- Exposed secrets or credentials (though none should exist)

### What NOT to Report

These are not security issues for this project:
- Typos or documentation errors (use regular issues)
- Broken links (use regular issues)
- Feature requests (use feature request template)

## Security Best Practices

This repository promotes security best practices through:

1. **Documentation**: Security guidance in patterns and practices
2. **Templates**: Security checklists and requirements
3. **Examples**: Secure coding patterns demonstrated
4. **Reviews**: Security checks in code review checklists

See:
- [Security Checks Pattern](../docs/03-patterns/validation-patterns/security-checks.md)
- [Code Review Checklist](../templates/checklists/code-review-checklist.md)

## Supported Versions

As a documentation project, we maintain:
- `main` branch: Current, actively maintained
- Tagged releases: Stable snapshots

Security updates are applied to the `main` branch and latest release.

## Security Updates

When security issues are fixed:
1. Fix is developed privately
2. Fix is reviewed and tested
3. Fix is released with security advisory
4. Documentation is updated if needed

## Scope

### In Scope
- Shell scripts in `/tools/scripts/`
- GitHub Actions workflows
- Dependencies in workflows
- Example code that could be copied by users

### Out of Scope
- Third-party tools referenced in documentation
- External links (we're not responsible for external content)
- User implementations based on framework guidance

## Acknowledgments

We appreciate responsible disclosure and will acknowledge security researchers who report valid vulnerabilities (with their permission).

## Contact

For security concerns:
- Use GitHub's private vulnerability reporting
- Or open a regular issue if not security-sensitive

For general questions, use the [discussions](https://github.com/rahulsidpatil/rsp-framework/discussions) or regular issues.
