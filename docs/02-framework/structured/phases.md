# Development Phases in AI-Native Development

## Overview

Software development lifecycle (SDLC) phases adapted for effective AI collaboration. Each phase has specific practices, patterns, and considerations for working with AI.

## The Five Phases

```
Requirements → Design → Implementation → Testing → Deployment
     ↓           ↓            ↓            ↓          ↓
  Planning   Architecture   Coding      Validation  Release
```

## Phase 1: Requirements & Planning

### Objective
Extract, clarify, and structure requirements with AI assistance

### AI Role
- Help clarify ambiguous requirements
- Suggest edge cases and considerations
- Generate user stories or acceptance criteria
- Identify potential technical challenges

### Activities

**1. Requirements Extraction**
```markdown
# Prompt: Extract Requirements

## Context
[Description of feature or problem]

## Goal
Extract structured, testable requirements

## Please provide
- Functional requirements
- Non-functional requirements
- Constraints and assumptions
- Edge cases
- Acceptance criteria
```

**2. Requirement Refinement**
- Clarify ambiguities
- Add technical details
- Define success criteria
- Identify dependencies

**3. Planning**
- Break down into tasks
- Estimate complexity
- Identify risks
- Define validation approach

### Outputs
- ✅ Clear, structured requirements
- ✅ Acceptance criteria
- ✅ Task breakdown
- ✅ Risk assessment

### Validation
- [ ] Requirements are specific and testable
- [ ] Edge cases identified
- [ ] Success criteria defined
- [ ] Team consensus on scope

---

## Phase 2: Design & Architecture

### Objective
Design system architecture and detailed solutions with AI input

### AI Role
- Suggest architectural approaches
- Evaluate trade-offs
- Generate design documents
- Propose patterns and structures

### Activities

**1. Architecture Design**
```markdown
# Prompt: Design Architecture

## Context
[Project context, tech stack, requirements]

## Goal
Design scalable, maintainable architecture for [feature]

## Please provide
- Component structure
- Data flow
- API design
- Design patterns to use
- Trade-offs and considerations
```

**2. Detailed Design**
- Interface definitions
- Data models
- Algorithm selection
- Error handling strategy

**3. Design Review**
- Evaluate proposed design
- Consider alternatives
- Document decisions (ADRs)
- Get team feedback

### Outputs
- ✅ Architecture diagram
- ✅ Component specifications
- ✅ API contracts
- ✅ Architecture Decision Records

### Validation
- [ ] Design meets requirements
- [ ] Scalability considered
- [ ] Security addressed
- [ ] Maintainability evaluated
- [ ] Trade-offs documented

---

## Phase 3: Implementation

### Objective
Generate and refine code with AI assistance

### AI Role
- Generate implementation code
- Suggest optimizations
- Handle boilerplate
- Implement patterns

### Activities

**1. Core Implementation**
```markdown
# Prompt: Implement Feature

## Context
[Architecture, requirements, constraints]

## Goal
Implement [specific component/feature]

## Requirements
[Detailed specifications]

## Please provide
- Implementation code
- Error handling
- Input validation
- Tests
```

**2. Iterative Refinement**
- Review generated code
- Request improvements
- Add edge case handling
- Optimize performance

**3. Integration**
- Connect components
- Handle dependencies
- Ensure consistency
- Update documentation

### Outputs
- ✅ Functional code
- ✅ Unit tests
- ✅ Integration points
- ✅ Inline documentation

### Validation
- [ ] Code compiles/runs
- [ ] Follows project conventions
- [ ] Error handling present
- [ ] Tests included
- [ ] Security considerations addressed

---

## Phase 4: Testing & Validation

### Objective
Comprehensively test and validate AI-generated code

### AI Role
- Generate test cases
- Suggest edge cases
- Create test data
- Help debug issues

### Activities

**1. Test Generation**
```markdown
# Prompt: Generate Tests

## Context
[Code to test, requirements]

## Goal
Create comprehensive test suite

## Please provide
- Unit tests for all functions
- Integration tests for workflows
- Edge case tests
- Error condition tests
```

**2. Manual Testing**
- Run tests
- Review coverage
- Test edge cases
- Performance testing

**3. Issue Resolution**
- Debug failures
- Fix identified issues
- Re-test
- Update tests

### Outputs
- ✅ Comprehensive test suite
- ✅ Test results
- ✅ Bug fixes
- ✅ Coverage report

### Validation
- [ ] All tests pass
- [ ] Coverage meets threshold (>80%)
- [ ] Edge cases covered
- [ ] Performance acceptable
- [ ] Security scans pass

---

## Phase 5: Deployment & Monitoring

### Objective
Deploy code and monitor its performance

### AI Role
- Generate deployment scripts
- Create monitoring queries
- Suggest observability strategies
- Help troubleshoot issues

### Activities

**1. Deployment Preparation**
- Review deployment checklist
- Prepare rollback plan
- Set up monitoring
- Document deployment process

**2. Deployment**
```markdown
# Prompt: Deployment Strategy

## Context
[Application details, infrastructure]

## Goal
Safe, reliable deployment process

## Please provide
- Deployment steps
- Health checks
- Rollback procedure
- Monitoring setup
```

**3. Post-Deployment**
- Monitor metrics
- Watch for errors
- Gather feedback
- Plan iterations

### Outputs
- ✅ Deployment scripts
- ✅ Monitoring dashboard
- ✅ Runbook
- ✅ Post-deployment report

### Validation
- [ ] Deployment successful
- [ ] All health checks passing
- [ ] Monitoring in place
- [ ] Documentation updated
- [ ] Team trained

---

## Phase Transitions

### Requirements → Design
**Gate**: Requirements are clear, complete, and accepted

### Design → Implementation
**Gate**: Design is reviewed and approved, ADRs written

### Implementation → Testing
**Gate**: Code is complete, compiles, and follows conventions

### Testing → Deployment
**Gate**: All tests pass, security/performance validated

### Deployment → Maintenance
**Gate**: Deployed successfully, monitoring active

## Phase-Specific Prompting

### Early Phases (Requirements, Design)
- More open-ended prompts
- Focus on exploration
- Ask for alternatives
- Encourage creativity

### Middle Phases (Implementation, Testing)
- More specific prompts
- Clear constraints
- Detailed requirements
- Focus on correctness

### Late Phases (Deployment, Monitoring)
- Operational focus
- Risk mitigation
- Documentation
- Troubleshooting support

## Iterative Development

### Not Always Linear
```
Requirements ⟷ Design ⟷ Implementation ⟷ Testing
```

### Agile Integration
- Phases within sprints
- Continuous feedback
- Incremental delivery
- Regular retrospectives

### Phase Checkpoints
- Weekly: Review phase progress
- Sprint end: Validate phase completion
- Monthly: Refine phase processes

## Tools for Each Phase

### Requirements
- User story templates
- Requirement extraction prompts
- Acceptance criteria generators

### Design
- Architecture templates
- ADR templates
- Design review checklists

### Implementation
- Code generation prompts
- Refactoring patterns
- Integration guides

### Testing
- Test generation prompts
- Review checklists
- Coverage tools

### Deployment
- Deployment scripts
- Monitoring setup
- Runbook templates

## Best Practices

### DO
✅ Spend adequate time in early phases
✅ Document key decisions in each phase
✅ Validate before moving to next phase
✅ Iterate within phases as needed
✅ Learn and refine your phase processes

### DON'T
❌ Rush through requirements to code
❌ Skip design for "simple" features
❌ Move to testing with known issues
❌ Deploy without proper validation
❌ Forget to monitor after deployment

## Measuring Phase Effectiveness

### Metrics by Phase

**Requirements**
- Requirement change rate
- Clarification questions
- Stakeholder satisfaction

**Design**
- Design iterations needed
- ADR quality
- Architecture feedback score

**Implementation**
- Code review findings
- Rework percentage
- Implementation time

**Testing**
- Bugs found
- Test coverage
- Time to validate

**Deployment**
- Deployment success rate
- Rollback frequency
- Time to deploy

## Next Steps

- Learn [Design Patterns](patterns.md)
- Explore [Workflows](workflows.md)
- Use [Phase-Specific Templates](../../../templates/workflows/README.md)
