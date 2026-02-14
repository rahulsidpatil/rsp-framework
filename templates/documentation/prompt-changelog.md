# Prompt Changelog Template

Track the evolution and effectiveness of prompts over time.

## Template

```markdown
# Prompt Changelog: [Feature/Component]

## Prompt Version History

### Version 3 - YYYY-MM-DD
**Status**: Current
**File**: prompts/YYYY-MM-DD-feature-v3.md
**Changes from v2**:
- Added explicit security requirements
- Included specific test scenarios
- Referenced existing code patterns

**Results**:
- ✅ Code quality: Excellent
- ✅ First iteration success
- ✅ No security issues
- ⏱ Time saved: ~2 hours vs v2

**Lessons Learned**:
- Explicit security requirements prevent issues
- Referencing existing patterns improves consistency

---

### Version 2 - YYYY-MM-DD
**Status**: Superseded
**File**: prompts/YYYY-MM-DD-feature-v2.md
**Changes from v1**:
- Added project context
- Specified tech stack
- Included code style requirements

**Results**:
- ⚠️ Code quality: Good but needed security fixes
- ⚠️ Two iterations needed
- ⏱ Time: 30 min initial + 15 min fixes

**Issues**:
- Missing input validation
- Incomplete error handling

**Improvements for next version**:
- Add explicit security requirements
- Include validation checklist

---

### Version 1 - YYYY-MM-DD
**Status**: Superseded
**File**: prompts/YYYY-MM-DD-feature-v1.md
**Initial attempt**

**Results**:
- ❌ Code quality: Poor, wrong patterns
- ❌ Multiple iterations needed
- ⏱ Time: 45 min total with revisions

**Issues**:
- Too vague
- No context provided
- Wrong architectural pattern

**Lessons Learned**:
- Need to provide project context
- Must specify tech stack and patterns

---

## Summary Statistics

| Version | Iterations | Time | Quality | Success |
|---------|-----------|------|---------|---------|
| v1 | 3 | 45 min | Poor | ❌ |
| v2 | 2 | 45 min | Good | ⚠️ |
| v3 | 1 | 15 min | Excellent | ✅ |

## Best Practices Identified

1. Always include project context
2. Specify security requirements explicitly
3. Reference existing code patterns
4. Include specific test scenarios
5. Define code style expectations

## Reusable Elements

Elements that work well and can be reused:
- Project context section from v3
- Security requirements checklist
- Test scenario format
- Code style specification

## Next Steps

- Apply v3 learnings to other feature prompts
- Create standardized security checklist
- Document effective patterns library
```

## Usage

1. Create a changelog file for important prompts
2. Document each version with results
3. Track what works and what doesn't
4. Extract reusable patterns
5. Share learnings with team

## Benefits

- Learn from experience
- Improve prompts over time
- Share effective patterns
- Reduce iteration time
- Build team knowledge

## See Also

- [Version Control](../../docs/02-framework/reproducible/version-control.md)
- [Continuous Improvement](../../docs/04-practices/continuous-improvement.md)
