<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Design Patterns for AI-Native Development

## Overview

Reusable patterns for effective AI collaboration across different development scenarios.

## Pattern Categories

1. **Prompt Patterns** - How to structure AI interactions
2. **Context Patterns** - Managing information flow
3. **Workflow Patterns** - Process structures
4. **Validation Patterns** - Quality assurance approaches

---

## Prompt Patterns

### Pattern: Structured Prompting

**Problem**: Vague prompts lead to inconsistent results

**Solution**: Use structured template with clear sections

**Template**:
```markdown
# [Title]

## Context
[Background information]

## Goal
[What you want to achieve]

## Requirements
[Specific requirements]

## Constraints
[Limitations]

## Expected Output
[What you expect]
```

**When to Use**:
- Complex features
- Critical implementations
- Team collaboration

---

### Pattern: Progressive Refinement

**Problem**: Getting everything right in one prompt is difficult

**Solution**: Start broad, refine iteratively

**Process**:
1. Initial broad prompt
2. Review output
3. Refine with specific feedback
4. Iterate until satisfied

**Example**:
```
Prompt 1: "Create a user authentication API"
Review: Good structure, but missing rate limiting

Prompt 2: "Add rate limiting to prevent brute force attacks"
Review: Good, but error messages could be more specific

Prompt 3: "Improve error messages to be more user-friendly"
Final: Complete implementation
```

**When to Use**:
- Exploratory development
- Unclear requirements
- Complex features

---

### Pattern: Test-Driven Prompting

**Problem**: AI-generated code may not meet specific requirements

**Solution**: Provide tests first, ask AI to implement

**Process**:
1. Write tests defining expected behavior
2. Provide tests in prompt
3. AI generates implementation
4. Validate against tests

**Example**:
```markdown
# Implement Password Hashing

## Tests Provided
```javascript
test('hashes password securely', () => {
    const password = 'test123';
    const hashed = hashPassword(password);
    expect(hashed).not.toBe(password);
    expect(verifyPassword(password, hashed)).toBe(true);
});
```

Please implement hashPassword and verifyPassword to pass these tests.
```

**When to Use**:
- Critical functionality
- Clear specifications
- Quality-focused development

---

## Context Patterns

### Pattern: Context Inheritance

**Problem**: Repeating context in every prompt is inefficient

**Solution**: Create reusable context documents

**Structure**:
```
project/
├── context/
│   ├── project-overview.md
│   ├── tech-stack.md
│   └── conventions.md
└── prompts/
    └── feature-x.md (references context/)
```

**Example**:
```markdown
# Feature: User Profile API

## Context
See: context/project-overview.md, context/tech-stack.md

## Feature-Specific Context
[Only new information specific to this feature]
```

**When to Use**:
- Multiple related features
- Team collaboration
- Long-term projects

---

### Pattern: Layered Context

**Problem**: Too much context overwhelms the AI

**Solution**: Provide context in layers of relevance

**Layers**:
1. **Essential**: Must-know information
2. **Important**: Relevant details
3. **Reference**: Available if needed

**Example**:
```markdown
## Essential Context
- Language: TypeScript
- Framework: Express.js
- Database: PostgreSQL

## Important Context
- Use JWT for auth
- Follow REST conventions
- Error handling via middleware

## Reference Context
- See docs/api-conventions.md for details
- See docs/database-schema.md for models
```

**When to Use**:
- Complex projects
- Avoid token limit issues
- Focus AI attention

---

## Workflow Patterns

### Pattern: Phase-Gate Development

**Problem**: Rushing through phases leads to issues

**Solution**: Validate completion at each phase gate

**Structure**:
```
Requirements → [Gate] → Design → [Gate] → Implementation
```

**Gates**:
- Requirements complete and approved?
- Design reviewed and documented?
- Implementation tested and validated?

**When to Use**:
- Critical features
- Team development
- Quality-focused projects

---

### Pattern: Incremental Delivery

**Problem**: Big-bang implementations are risky

**Solution**: Build and validate incrementally

**Process**:
1. Implement smallest usable piece
2. Test and validate
3. Add next piece
4. Repeat

**Example**:
```
Increment 1: Basic CRUD endpoints → Test → ✓
Increment 2: Add validation → Test → ✓
Increment 3: Add authentication → Test → ✓
Increment 4: Add rate limiting → Test → ✓
```

**When to Use**:
- Complex features
- Uncertainty in requirements
- Risk mitigation

---

### Pattern: Parallel Development

**Problem**: Sequential development is slow

**Solution**: Develop independent components in parallel

**Approach**:
- Identify independent components
- Define interfaces upfront
- Develop in parallel
- Integrate and test

**Example**:
```
Parallel Track 1: Frontend UI components
Parallel Track 2: Backend API endpoints
Parallel Track 3: Database migrations

Then: Integration testing
```

**When to Use**:
- Well-defined interfaces
- Independent components
- Time constraints

---

## Validation Patterns

### Pattern: Multi-Layer Validation

**Problem**: Single validation approach misses issues

**Solution**: Validate at multiple levels

**Layers**:
1. **Automated Tests**: Unit, integration, e2e
2. **Static Analysis**: Linting, type checking, security scans
3. **Code Review**: Human review of logic and design
4. **Runtime Validation**: Monitoring in production

**When to Use**:
- Critical systems
- Production code
- Security-sensitive features

---

### Pattern: Validation Checkpoints

**Problem**: Errors compound if caught late

**Solution**: Validate frequently at key points

**Checkpoints**:
- After prompt execution: Does it compile?
- After implementation: Do tests pass?
- After code review: Is it approved?
- After deployment: Is it working?

**When to Use**:
- All development
- Risk mitigation
- Quality assurance

---

## Collaboration Patterns

### Pattern: Shared Context Repository

**Problem**: Team members recreate context

**Solution**: Centralized context documentation

**Structure**:
```
docs/
├── context/
│   ├── architecture.md
│   ├── conventions.md
│   └── patterns.md
└── prompts/
    └── templates/
```

**When to Use**:
- Team development
- Knowledge sharing
- Consistency

---

### Pattern: Prompt Review

**Problem**: Ineffective prompts aren't caught

**Solution**: Peer review significant prompts

**Process**:
1. Draft prompt
2. Team member reviews
3. Refine based on feedback
4. Execute and document results

**When to Use**:
- Critical features
- Learning phase
- Quality focus

---

## Anti-Patterns to Avoid

### Anti-Pattern: Prompt Dumping
**Problem**: Dumping all information without structure

**Fix**: Use structured templates and layered context

### Anti-Pattern: Over-Specification
**Problem**: So specific that AI can't think creatively

**Fix**: Balance constraints with flexibility

### Anti-Pattern: Under-Specification
**Problem**: Too vague to get useful results

**Fix**: Provide adequate context and requirements

### Anti-Pattern: Ignoring Validation
**Problem**: Accepting AI output without review

**Fix**: Always validate through multiple means

### Anti-Pattern: One-Shot Development
**Problem**: Expecting perfect output immediately

**Fix**: Use progressive refinement

---

## Pattern Selection Guide

### For New Features
1. Structured Prompting
2. Phase-Gate Development
3. Incremental Delivery
4. Multi-Layer Validation

### For Bug Fixes
1. Progressive Refinement
2. Test-Driven Prompting
3. Validation Checkpoints

### For Refactoring
1. Incremental Delivery
2. Context Inheritance
3. Multi-Layer Validation

### For Exploration
1. Progressive Refinement
2. Layered Context
3. Parallel Development

## Next Steps

- Apply patterns to your workflow
- Learn [Standard Workflows](workflows.md)
- Use [Pattern Templates](../../../templates/workflows/README.md)
- Explore [Prompt Patterns](../../03-patterns/prompt-patterns/README.md)
