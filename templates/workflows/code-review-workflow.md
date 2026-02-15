<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Code Review Workflow

Process for systematically reviewing AI-generated code.

## Quick Workflow

### Step 1: Automated Checks (5 min)
- [ ] Run linter
- [ ] Run tests
- [ ] Run security scanner
- [ ] Check type safety
- [ ] Verify all pass

### Step 2: Self-Review (15-20 min)
- [ ] Author reviews own code
- [ ] Checks against requirements
- [ ] Runs code locally
- [ ] Verifies behavior
- [ ] Updates based on findings

### Step 3: Peer Review (20-30 min)
- [ ] Use [Code Review Checklist](../checklists/code-review-checklist.md)
- [ ] Review functionality
- [ ] Check security
- [ ] Verify tests
- [ ] Leave constructive feedback

### Step 4: Address Feedback (varies)
- [ ] Respond to comments
- [ ] Make requested changes
- [ ] Re-run validation
- [ ] Update PR

### Step 5: Approval & Merge (5-10 min)
- [ ] All checks passing
- [ ] Feedback addressed
- [ ] Approved by reviewer
- [ ] Merge to main
- [ ] Delete branch

## See Also

- [Code Review Checklist](../checklists/code-review-checklist.md)
- [Code Review Pattern](../../docs/03-patterns/validation-patterns/code-review.md)
