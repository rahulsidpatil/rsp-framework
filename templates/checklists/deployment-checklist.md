<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Deployment Checklist

Pre-deployment validation for AI-generated code.

## Checklist

### Code Quality
- [ ] All tests passing
- [ ] Code coverage meets requirements (80%+)
- [ ] No linting errors
- [ ] Type checking passes
- [ ] Code reviewed and approved

### Security
- [ ] Security scans completed
- [ ] No high/critical vulnerabilities
- [ ] Dependencies up to date
- [ ] No exposed secrets
- [ ] Authentication/authorization verified

### Functionality
- [ ] Feature works as expected
- [ ] Edge cases handled
- [ ] Error handling tested
- [ ] Integration tested
- [ ] Manual testing completed

### Performance
- [ ] Performance benchmarks run
- [ ] No performance regressions
- [ ] Resource usage acceptable
- [ ] Load testing completed (if applicable)

### Documentation
- [ ] Code documented
- [ ] API docs updated
- [ ] README updated
- [ ] CHANGELOG updated
- [ ] Deployment notes prepared

### Database
- [ ] Migrations tested
- [ ] Backup verified
- [ ] Rollback plan ready
- [ ] Data integrity checked

### Monitoring
- [ ] Logging configured
- [ ] Metrics/alerts set up
- [ ] Error tracking enabled
- [ ] Health checks working

### Rollback Plan
- [ ] Rollback procedure documented
- [ ] Previous version tagged
- [ ] Team notified of deployment
- [ ] Rollback tested

### Communication
- [ ] Stakeholders notified
- [ ] Team briefed
- [ ] Documentation shared
- [ ] Support team prepared

## Post-Deployment

### Immediate (0-1 hour)
- [ ] Deployment successful
- [ ] Health checks passing
- [ ] No errors in logs
- [ ] Key features verified

### Short-term (1-24 hours)
- [ ] Monitor metrics
- [ ] Watch error rates
- [ ] Check performance
- [ ] Gather feedback

### Follow-up
- [ ] Retrospective scheduled
- [ ] Lessons documented
- [ ] Process improvements identified

## Emergency Response

If issues arise:
1. Assess severity
2. Communicate to team
3. Execute rollback if critical
4. Debug and fix
5. Document incident

## See Also

- [Quality Gates](../../docs/03-patterns/validation-patterns/quality-gates.md)
- [Testing Pattern](../../docs/03-patterns/prompt-patterns/testing.md)
