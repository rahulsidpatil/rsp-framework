# Context Windows Pattern

## Intent
Effectively manage information within AI token limits to provide relevant context without overwhelming the model.

## Context
- Large codebases exceeding token limits
- Complex features requiring extensive background
- Limited token budgets
- Need to prioritize information

## Problem
AI models have token limits. Including too much context wastes tokens or hits limits. Too little context results in poor outputs.

## Solution
Strategic context selection and compression techniques.

## Key Strategies

### 1. Prioritize Information

**Three-Tier Approach**:

```markdown
## ESSENTIAL (Always Include)
- Function signature / API contract
- Key requirements
- Critical constraints

## IMPORTANT (Include if space)
- Implementation guidelines
- Related patterns
- Common pitfalls

## REFERENCE (Link, don't include)
- Full documentation
- Historical decisions
- Detailed examples
```

### 2. Chunk Large Contexts

Break large prompts into focused chunks:

```
Session 1: Design architecture (with arch context)
Session 2: Implement module A (with module A context)
Session 3: Implement module B (with module B context)
Session 4: Integration (with integration context)
```

### 3. Use Summaries

Instead of full code, provide summaries:

```markdown
## Existing Auth Module
- Located: src/auth/
- Provides: login(), logout(), validateToken()
- Uses JWT with 24h expiry
- See: src/auth/README.md for details
```

### 4. Link to External Resources

```markdown
## Tech Stack Details
Full architecture: https://wiki.company.com/arch
API docs: https://api-docs.company.com
Coding standards: docs/STANDARDS.md
```

## Examples

### Example 1: Feature Development with Large Codebase

**Bad - Too Much Context**:
```markdown
[Pastes entire 50-file codebase]

Please add user profile feature
```

**Good - Targeted Context**:
```markdown
# Add User Profile Feature

## Essential Context
- Project: Node.js/Express REST API
- Auth: JWT-based (implementation: src/auth/)
- User model: src/models/User.ts
- Pattern: Service layer + Controllers

## Relevant Existing Code
`src/models/User.ts` (core fields only):
```ts
interface User {
  id: string;
  email: string;
  passwordHash: string;
  // Need to add: profile fields
}
```

Similar feature reference: src/features/settings/
(follows same pattern)

## Requirements
[Specific feature requirements]

Full docs: docs/architecture.md
```

### Example 2: Code Review with Token Budget

**Bad - Full File**:
```markdown
[Pastes 500-line file]

Please review this code
```

**Good - Focused Review**:
```markdown
# Review: User Authentication Logic

## Specific Areas of Concern
1. Password hashing (lines 45-60)
2. Error handling (lines 120-150)
3. Rate limiting (lines 200-230)

## Code to Review
```ts
// Lines 45-60: Password hashing
[relevant code snippet]
```

Full file: src/auth/UserAuth.ts
Context: We've had security incidents related to auth
```

## Token Estimation

### Quick Estimates
- 1 token ≈ 4 characters
- 1 token ≈ 0.75 words
- Average code: ~1.5 tokens/word

### Tools
- OpenAI Tokenizer: https://platform.openai.com/tokenizer
- tiktoken library (Python)
- Token counters in AI tool interfaces

### Budget Planning

For 100k token model:
- Reserve 20k for response
- 80k available for context
- ~60k words or ~40k lines of code

## Context Compression Techniques

### 1. Remove Comments
Include only essential comments:
```typescript
// Before (with all comments)
/**
 * Validates user email
 * @param email - The email to validate
 * @returns true if valid, false otherwise
 * @example
 * validateEmail('test@example.com') // returns true
 */
function validateEmail(email: string): boolean {
  // Check if email is not empty
  if (!email) return false;
  // Validate format using regex
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

// After (compressed)
function validateEmail(email: string): boolean {
  if (!email) return false;
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}
```

### 2. Summarize Imports
```typescript
// Instead of listing all imports:
import { User } from './models/User';
import { Database } from './database';
// ... 50 more imports

// Summarize:
// Imports: User model, Database, Auth services, etc.
```

### 3. Provide Interfaces Over Implementation
```typescript
// Instead of full implementation:
class UserService {
  async createUser(data) { /* 100 lines */ }
  async updateUser(id, data) { /* 100 lines */ }
  // ... more methods
}

// Provide interface:
interface UserService {
  createUser(data: CreateUserData): Promise<User>;
  updateUser(id: string, data: UpdateUserData): Promise<User>;
  // ... signatures only
}
```

## Dynamic Context Loading

### Progressive Disclosure Pattern

```markdown
# Initial Prompt (Minimal Context)
Implement user authentication

[AI asks clarifying questions]

# Follow-up (Add Specific Context)
Here's our auth pattern:
[Specific relevant code]

[AI implements]

# Refinement (Edge Cases)
Handle these edge cases:
[Additional context]
```

## Tools and Automation

### Context Selector Script
```bash
#!/bin/bash
# select-context.sh
# Helper to select relevant files

echo "# Selected Context"
echo ""

# Include only relevant files
for file in "$@"; do
    echo "## $file"
    head -n 50 "$file"  # First 50 lines
    echo "..."
done
```

### AI Context Files
```
.aicontext       # Some tools auto-read this
CLAUDE.md        # Claude Code reads this
.clinerules      # Cline reads this
```

## Best Practices

### DO
✅ Prioritize essential information
✅ Use summaries for large code
✅ Link to full documentation
✅ Estimate token usage
✅ Break into focused sessions

### DON'T
❌ Paste entire codebase
❌ Include redundant information
❌ Assume more is better
❌ Forget to compress
❌ Ignore token limits

## Measuring Success

### Indicators
- AI produces relevant output without asking for more context
- Stay well within token limits
- Responses are accurate and complete
- Minimal back-and-forth for clarification

### Red Flags
- Hitting token limits frequently
- AI requests same information repeatedly
- Responses are generic or off-target
- Need many iterations to clarify

## Related Patterns

- **Session Continuity**: Managing multi-step interactions
- **Knowledge Persistence**: Storing reusable context
- **Layered Context**: Organizing information by priority

## Next Steps

- Estimate token usage for your typical prompts
- Create context summaries for large modules
- Practice compression techniques
- Monitor token usage in your workflow
