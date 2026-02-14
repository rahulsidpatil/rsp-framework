# Session Continuity Pattern

## Intent
Maintain context and build on previous work across multiple AI interactions within a session.

## Context
- Multi-step development tasks
- Iterative refinement
- Progressive feature building
- Complex problem-solving

## Problem
AI assistants may lose track of previous interactions or context. Work done in earlier prompts may not inform later ones, leading to inconsistency or redundant clarifications.

## Solution
Establish patterns for referencing and building upon previous interactions within a session.

## Key Techniques

### 1. Reference Previous Outputs

```markdown
# Iteration 2

## Previous Work
In the last prompt, you generated the User model with these fields: [list]

## Next Step
Now extend the model to include profile information
```

### 2. Incremental Building

```markdown
Step 1: Generate basic CRUD operations ✓
Step 2: Add validation (current)
Step 3: Add authentication (next)
Step 4: Add tests
```

### 3. Maintain State Explicitly

```markdown
## Current State
- ✅ Database schema defined
- ✅ Models created
- ✅ Basic endpoints implemented
- ⏳ Need: validation
- ⏳ Need: tests
```

### 4. Thread Conversations

```markdown
# Following up on Auth Implementation

## What We've Built So Far
[Summary of previous work]

## What We're Adding Now
[Current focus]

## Consistency Requirements
- Use same patterns as before
- Follow established conventions
- Integrate with existing code
```

## Examples

### Example 1: Feature Development

**Prompt 1: Design**
```markdown
# Design User Profile API

## Requirements
[List requirements]

Please design:
1. Data model
2. API endpoints
3. Architecture approach
```

**Prompt 2: Implementation (Building on Design)**
```markdown
# Implement User Profile API

## Approved Design
From previous interaction:
- Model: [summary of designed model]
- Endpoints: GET/POST/PUT /api/profile
- Architecture: Service layer pattern

## Now Implement
Generate implementation following the approved design
```

**Prompt 3: Testing (Building on Implementation)**
```markdown
# Add Tests for User Profile API

## Implemented Code
In the last step, we implemented:
- UserProfileService
- ProfileController
- Routes

## Now Generate
Comprehensive tests for all components
Follow the same patterns as existing tests in tests/auth/
```

### Example 2: Iterative Refinement

**Prompt 1: Initial**
```markdown
Generate a password validation function
```

**Prompt 2: Refine**
```markdown
The previous validation function works but needs improvement:
- Current: Returns only true/false
- Needed: Return specific error messages

Please refactor to return detailed validation errors
```

**Prompt 3: Enhance**
```markdown
Great! Now that we have detailed error messages, let's add:
- Password strength indicator (weak/medium/strong)
- Suggestions for improvement

Maintain the error message functionality from previous version
```

## Session State Management

### Explicit State Tracking

```markdown
# Session State Document

## Completed
1. ✅ User model defined
2. ✅ Auth endpoints created
3. ✅ Tests passing

## Current Task
4. ⏳ Add profile management

## Queued
5. ⏹️ Add email notifications
6. ⏹️ Add audit logging

## Decisions Made
- Using JWT for auth
- PostgreSQL for database
- Express.js framework
```

### Context Summaries

```markdown
# Quick Context Recap

We're building a user management system.

So far:
- Set up Express + PostgreSQL
- Implemented JWT authentication
- Created User and Session models

Currently:
- Adding user profile features
- Following same patterns as auth module

Next:
- Will add profile picture upload
```

## Multi-Turn Patterns

### Pattern: Progressive Elaboration

```
Turn 1: High-level design
  ↓
Turn 2: Detailed design
  ↓
Turn 3: Core implementation
  ↓
Turn 4: Edge cases
  ↓
Turn 5: Tests
  ↓
Turn 6: Documentation
```

### Pattern: Feedback Loop

```
Turn 1: Generate code
  ↓
Turn 2: Review and provide feedback
  ↓
Turn 3: Refine based on feedback
  ↓
Turn 4: Verify improvements
```

### Pattern: Divide and Conquer

```
Turn 1: Break problem into sub-tasks
  ↓
Turn 2: Solve sub-task A
  ↓
Turn 3: Solve sub-task B
  ↓
Turn 4: Solve sub-task C
  ↓
Turn 5: Integrate all sub-tasks
```

## Tools and Techniques

### Session Notes

Keep a running note:
```markdown
<!-- session-notes.md -->
# Session: User Profile Feature
Date: 2024-02-14

## Turn 1: Requirements
[Summary]

## Turn 2: Design
[Summary]

## Turn 3: Implementation
[Summary]

## Key Decisions
- Decided on X because Y
- Changed approach from A to B
```

### Checkpointing

```markdown
## Checkpoint: Basic Auth Complete

What works:
- Login/logout
- Token validation
- Password hashing

What's next:
- Profile management
- Email verification
```

### Cross-Referencing

```markdown
## Implementation

Following patterns from:
- Auth module (Turn 2)
- User service (Turn 5)
- Test structure (Turn 3)

Maintaining consistency with previous decisions
```

## Best Practices

### DO
✅ Summarize previous work
✅ Reference specific outputs
✅ Maintain explicit state
✅ Build incrementally
✅ Track decisions

### DON'T
❌ Assume AI remembers everything
❌ Contradict previous decisions without acknowledgment
❌ Jump around randomly
❌ Forget to sync state
❌ Lose thread of conversation

## When Things Go Off Track

### Realign
```markdown
## Let's Realign

We seem to have diverged from our approach.

Original plan: [Summarize]
Current situation: [What happened]
Let's get back to: [Correct direction]
```

### Reset if Needed
```markdown
## Fresh Start with Context

Previous attempts: [Brief summary]
What didn't work: [Issues]

Starting fresh with this approach: [New direction]
Key learnings from before: [What to keep]
```

## Measuring Effectiveness

### Success Indicators
- AI builds on previous work consistently
- No need to repeat context
- Smooth progression through steps
- Coherent end result

### Warning Signs
- AI asks for already-provided information
- Outputs contradict earlier work
- Inconsistent patterns across turns
- Need to restart frequently

## Related Patterns

- **Context Windows**: Managing token limits
- **Knowledge Persistence**: Long-term context storage
- **Progressive Refinement**: Iterative improvement

## Next Steps

- Practice building incrementally in sessions
- Maintain explicit state tracking
- Reference previous work clearly
- Learn from successful multi-turn sessions
