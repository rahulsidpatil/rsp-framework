<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Standard Workflows for AI-Native Development

## Overview

Step-by-step workflows for common development tasks using AI collaboration.

## Workflow Library

1. [Feature Development](#feature-development-workflow)
2. [Bug Fixing](#bug-fixing-workflow)
3. [Code Refactoring](#refactoring-workflow)
4. [API Development](#api-development-workflow)
5. [Testing Implementation](#testing-workflow)

---

## Feature Development Workflow

### Overview
Complete workflow for implementing a new feature with AI assistance.

### Steps

#### 1. Requirements Gathering
**Goal**: Extract clear, testable requirements

**Actions**:
- [ ] Document feature description
- [ ] Identify stakeholders
- [ ] Extract functional requirements
- [ ] Define acceptance criteria
- [ ] Identify edge cases

**AI Prompt**:
```markdown
# Extract Requirements for [Feature]

## Feature Description
[Brief description]

## Please provide:
1. Structured functional requirements
2. Non-functional requirements
3. Edge cases to consider
4. Acceptance criteria
5. Potential technical challenges
```

#### 2. Design & Planning
**Goal**: Create architectural design

**Actions**:
- [ ] Design architecture
- [ ] Define interfaces/APIs
- [ ] Choose patterns and approaches
- [ ] Document design decisions (ADR)
- [ ] Create implementation plan

**AI Prompt**:
```markdown
# Design Architecture for [Feature]

## Context
[Project context, tech stack, requirements]

## Requirements
[From step 1]

## Please provide:
1. Component architecture
2. Data model design
3. API interfaces
4. Design patterns to use
5. Trade-offs and considerations
```

#### 3. Implementation
**Goal**: Generate working code

**Actions**:
- [ ] Implement core functionality
- [ ] Add error handling
- [ ] Add input validation
- [ ] Write inline documentation
- [ ] Follow project conventions

**AI Prompt**:
```markdown
# Implement [Feature]

## Context
[Architecture from step 2]

## Requirements
[Detailed specifications]

## Please provide:
- Implementation code
- Error handling
- Input validation
- Inline comments
- Usage examples
```

#### 4. Testing
**Goal**: Validate implementation

**Actions**:
- [ ] Generate test cases
- [ ] Run tests
- [ ] Check coverage
- [ ] Test edge cases
- [ ] Performance testing

**AI Prompt**:
```markdown
# Generate Tests for [Feature]

## Code to Test
[Implementation from step 3]

## Please provide:
- Unit tests for all functions
- Integration tests
- Edge case tests
- Error condition tests
- Test data/fixtures
```

#### 5. Review & Integration
**Goal**: Quality assurance and integration

**Actions**:
- [ ] Code review
- [ ] Security review
- [ ] Performance review
- [ ] Update documentation
- [ ] Merge code

**Checklist**: Use [Code Review Checklist](../../../templates/checklists/code-review-checklist.md)

---

## Bug Fixing Workflow

### Overview
Systematic approach to debugging and fixing issues.

### Steps

#### 1. Issue Reproduction
**Goal**: Understand and reproduce the bug

**Actions**:
- [ ] Gather bug report details
- [ ] Reproduce locally
- [ ] Document steps to reproduce
- [ ] Identify affected components

**AI Prompt**:
```markdown
# Analyze Bug Report

## Bug Description
[Description from issue]

## Steps to Reproduce
[Known steps]

## Please help:
1. Identify likely causes
2. Suggest debugging approach
3. Identify affected components
4. Recommend diagnostic tests
```

#### 2. Root Cause Analysis
**Goal**: Identify the underlying cause

**Actions**:
- [ ] Review related code
- [ ] Check logs and errors
- [ ] Test hypotheses
- [ ] Identify root cause

**AI Prompt**:
```markdown
# Debug Root Cause

## Bug Behavior
[What's happening]

## Related Code
[Code snippets]

## Error Messages
[Any errors]

## Please analyze:
1. Likely root cause
2. Why it's happening
3. Related issues
4. Recommended fix approach
```

#### 3. Solution Design
**Goal**: Plan the fix

**Actions**:
- [ ] Design solution
- [ ] Consider side effects
- [ ] Plan testing approach
- [ ] Document decision

**AI Prompt**:
```markdown
# Design Fix for Bug

## Root Cause
[From step 2]

## Constraints
[Any limitations]

## Please provide:
1. Recommended solution
2. Alternative approaches
3. Potential side effects
4. Testing strategy
```

#### 4. Implementation
**Goal**: Fix the bug

**Actions**:
- [ ] Implement fix
- [ ] Add regression test
- [ ] Verify fix works
- [ ] Check for side effects

**AI Prompt**:
```markdown
# Implement Bug Fix

## Root Cause
[Identified cause]

## Solution Design
[From step 3]

## Please provide:
- Fix implementation
- Regression test
- Verification approach
```

#### 5. Verification
**Goal**: Ensure bug is fixed

**Actions**:
- [ ] Test original reproduction steps
- [ ] Run full test suite
- [ ] Check related functionality
- [ ] Document fix

---

## Refactoring Workflow

### Overview
Systematic code improvement while maintaining functionality.

### Steps

#### 1. Analysis
**Goal**: Understand current code

**Actions**:
- [ ] Review existing code
- [ ] Identify issues
- [ ] Understand dependencies
- [ ] Document current behavior

**AI Prompt**:
```markdown
# Analyze Code for Refactoring

## Current Code
[Code to refactor]

## Please analyze:
1. Code smells and issues
2. Improvement opportunities
3. Refactoring patterns to apply
4. Potential risks
```

#### 2. Planning
**Goal**: Plan refactoring approach

**Actions**:
- [ ] Define refactoring goals
- [ ] Choose refactoring pattern
- [ ] Plan incremental steps
- [ ] Identify tests needed

**AI Prompt**:
```markdown
# Plan Refactoring Strategy

## Current Code Analysis
[From step 1]

## Goals
[What to improve]

## Please provide:
1. Refactoring approach
2. Step-by-step plan
3. Test strategy
4. Risk mitigation
```

#### 3. Implementation
**Goal**: Execute refactoring

**Actions**:
- [ ] Refactor incrementally
- [ ] Run tests after each change
- [ ] Maintain functionality
- [ ] Update documentation

**AI Prompt**:
```markdown
# Refactor Code

## Current Code
[Code to refactor]

## Refactoring Plan
[From step 2]

## Please provide:
- Refactored code
- Explanation of changes
- Updated tests
- Documentation updates
```

#### 4. Validation
**Goal**: Ensure nothing broke

**Actions**:
- [ ] Run all tests
- [ ] Check performance
- [ ] Review code quality
- [ ] Verify functionality

---

## API Development Workflow

### Overview
Develop robust APIs with AI assistance.

### Steps

#### 1. API Design
**Goal**: Design API interface

**Actions**:
- [ ] Define endpoints
- [ ] Design request/response formats
- [ ] Document API contract
- [ ] Plan error handling

**AI Prompt**:
```markdown
# Design REST API

## Requirements
[What the API should do]

## Constraints
[RESTful principles, auth requirements]

## Please provide:
1. Endpoint definitions
2. Request/response schemas
3. Error responses
4. Authentication approach
```

#### 2. Implementation
**Goal**: Implement API endpoints

**Actions**:
- [ ] Implement routes/controllers
- [ ] Add validation
- [ ] Add authentication/authorization
- [ ] Implement error handling

#### 3. Testing
**Goal**: Test API thoroughly

**Actions**:
- [ ] Unit test controllers
- [ ] Integration test endpoints
- [ ] Test authentication
- [ ] Test error cases
- [ ] Load testing

#### 4. Documentation
**Goal**: Document API for consumers

**Actions**:
- [ ] Generate OpenAPI/Swagger docs
- [ ] Write usage examples
- [ ] Document authentication
- [ ] Create postman collection

---

## Testing Workflow

### Overview
Create comprehensive test suites with AI.

### Steps

#### 1. Test Planning
**Goal**: Define testing strategy

**Actions**:
- [ ] Identify what to test
- [ ] Choose test types
- [ ] Define coverage goals
- [ ] Plan test data

#### 2. Test Generation
**Goal**: Generate test cases

**AI Prompt**:
```markdown
# Generate Test Suite

## Code to Test
[Implementation]

## Requirements
[What should be tested]

## Please provide:
1. Unit tests for all functions
2. Integration tests for workflows
3. Edge case tests
4. Error condition tests
5. Test fixtures/data
```

#### 3. Test Execution
**Goal**: Run and validate tests

**Actions**:
- [ ] Run all tests
- [ ] Check coverage
- [ ] Fix failing tests
- [ ] Add missing tests

#### 4. Continuous Testing
**Goal**: Maintain test quality

**Actions**:
- [ ] Add tests for new features
- [ ] Update tests when code changes
- [ ] Maintain test data
- [ ] Monitor test health

---

## Workflow Customization

### Adapt to Your Context

**For Small Projects**:
- Simplify steps
- Combine phases
- Less documentation

**For Enterprise**:
- Add approval gates
- More documentation
- Comprehensive testing
- Security reviews

### Create Custom Workflows

1. Start with base workflow
2. Add/remove steps as needed
3. Document customizations
4. Share with team
5. Iterate based on feedback

## Workflow Templates

See [Templates Directory](../../../templates/workflows/) for:
- Detailed workflow templates
- Prompt templates for each step
- Checklists
- Examples

## Best Practices

### DO
✅ Follow workflows consistently
✅ Adapt to your needs
✅ Document deviations
✅ Review and improve workflows
✅ Share successful patterns

### DON'T
❌ Skip steps without reason
❌ Over-complicate simple tasks
❌ Ignore validation steps
❌ Rush through quality checks
❌ Forget to document

## Measuring Workflow Effectiveness

### Metrics
- Time to complete tasks
- Quality of outputs
- Number of iterations needed
- Consistency across team

### Success Indicators
- Predictable development velocity
- Fewer bugs escaping to production
- Easier onboarding
- Team satisfaction

## Next Steps

- Try a workflow on your next task
- Customize for your project
- Use [Workflow Templates](../../../templates/workflows/README.md)
- Share feedback and improvements
