<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Feature Development Workflow

Complete step-by-step workflow for implementing new features with AI assistance.

## Overview

See [Feature Development Workflow](../../docs/02-framework/structured/workflows.md#feature-development-workflow) for full details.

## Quick Workflow

### Step 1: Requirements (15-30 min)
- [ ] Use [Requirements Prompt](../prompts/requirements-prompt.md)
- [ ] Extract and clarify requirements
- [ ] Define acceptance criteria
- [ ] Identify edge cases
- [ ] Get stakeholder approval

### Step 2: Design (30-60 min)
- [ ] Design architecture
- [ ] Define interfaces/APIs
- [ ] Choose patterns
- [ ] Document decisions ([ADR Template](../documentation/decision-record.md))
- [ ] Create implementation plan

### Step 3: Implementation (varies)
- [ ] Use [Code Generation Prompt](../prompts/code-generation-prompt.md)
- [ ] Implement core functionality
- [ ] Add error handling
- [ ] Write inline documentation
- [ ] Follow project conventions

### Step 4: Testing (30-60 min)
- [ ] Use [Testing Prompt](../prompts/testing-prompt.md)
- [ ] Generate test cases
- [ ] Run tests
- [ ] Check coverage (80%+ target)
- [ ] Test edge cases

### Step 5: Review & Integration (30-45 min)
- [ ] Use [Code Review Checklist](../checklists/code-review-checklist.md)
- [ ] Self-review code
- [ ] Request peer review
- [ ] Address feedback
- [ ] Update documentation
- [ ] Merge code

## Tips

- Don't skip requirements phase
- Document design decisions
- Test as you go
- Review thoroughly
- Learn from each iteration

## See Also

- [Structured Workflows](../../docs/02-framework/structured/workflows.md)
- [Prompt Templates](../prompts/README.md)
- [Checklists](../checklists/README.md)
