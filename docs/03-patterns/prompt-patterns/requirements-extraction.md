<!-- This is V1.0.0 of RSP AI Native SDLC Framework -->

# Requirements Extraction Pattern

## Intent
Extract clear, testable requirements from vague or incomplete feature descriptions.

## Context
- Starting a new feature
- Clarifying stakeholder requests
- Planning implementation
- Defining acceptance criteria

## Problem
Stakeholders often provide high-level descriptions like "add user profiles" without specific requirements. Developers need detailed, testable requirements to implement correctly.

## Solution
Use structured prompts to systematically extract and clarify requirements.

### Template

```markdown
# Extract Requirements: [Feature Name]

## Feature Description
[High-level description from stakeholder]

## Current System Context
- Current features: [What exists now]
- Users: [Who will use this]
- Tech stack: [Relevant technologies]
- Constraints: [Known limitations]

## Please provide:

### 1. Functional Requirements
List specific, testable functional requirements

### 2. Non-Functional Requirements
- Performance expectations
- Security requirements
- Scalability needs
- Accessibility requirements

### 3. User Stories
Write user stories in format: "As a [role], I want [feature] so that [benefit]"

### 4. Acceptance Criteria
For each user story, provide acceptance criteria

### 5. Edge Cases
Identify potential edge cases and error scenarios

### 6. Dependencies
List dependencies on other systems or features

### 7. Technical Considerations
Highlight technical challenges or decisions needed

### 8. Open Questions
List questions that need stakeholder clarification
```

## Example

### Input Prompt

```markdown
# Extract Requirements: User Profile Feature

## Feature Description
"We need user profiles where people can add their info and avatar."

## Current System Context
- Current features: User authentication (email/password), basic dashboard
- Users: B2B SaaS users (professionals)
- Tech stack: React, Node.js, PostgreSQL
- Constraints: GDPR compliance required

## Please provide:
[sections as per template]
```

### AI Response (Excerpt)

```markdown
### 1. Functional Requirements

FR-1: Users shall be able to view their profile information
FR-2: Users shall be able to edit the following fields:
  - Full name (required)
  - Email address (required, validated)
  - Job title (optional)
  - Company (optional)
  - Bio (optional, max 500 characters)
FR-3: Users shall be able to upload an avatar image
  - Supported formats: JPG, PNG
  - Max size: 5MB
  - Auto-resize to 200x200px
FR-4: Users shall be able to remove their avatar
FR-5: Profile changes shall be saved immediately
FR-6: Users shall receive confirmation of successful updates

### 2. Non-Functional Requirements

Performance:
- Profile page load: < 1 second
- Avatar upload: < 3 seconds

Security:
- Profile visibility: private by default
- Data validation on all inputs
- Image upload security (type/size checks)

Privacy/Compliance:
- GDPR: Users can export profile data
- GDPR: Users can delete profile data
- Audit log of profile changes

### 3. User Stories

US-1: As a user, I want to add my professional information to my profile
      so that my teammates can learn about me

US-2: As a user, I want to upload a profile picture
      so that I'm recognizable in the platform

US-3: As a user, I want to edit my profile information
      so that I can keep it current

### 4. Acceptance Criteria

For US-1 (Professional Information):
- ✓ Profile form displays all fields
- ✓ Required fields are marked
- ✓ Form validates input before submission
- ✓ Success message shown after save
- ✓ Changes persist after page refresh

For US-2 (Profile Picture):
- ✓ Upload button is clearly visible
- ✓ File picker accepts JPG/PNG only
- ✓ Preview shown before confirmation
- ✓ Image is cropped/resized appropriately
- ✓ Remove button available for existing avatar

### 5. Edge Cases

EC-1: Very long names (100+ characters)
EC-2: Special characters in names (unicode, emojis)
EC-3: Invalid email format
EC-4: Duplicate email (conflicts with another user)
EC-5: Oversized images (> 5MB)
EC-6: Invalid image formats
EC-7: Network failure during upload
EC-8: Concurrent profile edits from multiple sessions

### 6. Dependencies

D-1: User authentication system (existing)
D-2: File storage service (need to choose: S3, CloudFlare, etc.)
D-3: Email validation service
D-4: Image processing library

### 7. Technical Considerations

TC-1: Choose file storage solution (CDN recommended for avatars)
TC-2: Implement image resizing (server-side vs client-side?)
TC-3: Profile data caching strategy
TC-4: Real-time validation UI feedback
TC-5: GDPR compliance: data export format and process

### 8. Open Questions

Q-1: Should profiles be visible to other users? (Public/Private setting?)
Q-2: What fields are mandatory vs optional?
Q-3: Do we need profile completion percentage?
Q-4: Should we support additional fields in the future?
Q-5: Do we need profile change history/versioning?
```

## Consequences

### Benefits
✅ Clear, comprehensive requirements
✅ Identifies gaps and questions early
✅ Testable acceptance criteria
✅ Reduces ambiguity
✅ Uncovers edge cases
✅ Facilitates planning

### Trade-offs
⚠️ Takes time upfront
⚠️ May surface complexity
⚠️ Requires stakeholder follow-up
⚠️ Can be overwhelming for simple features

## When to Use

**Use for**:
- New features with unclear scope
- Stakeholder requests lacking detail
- Complex features with many considerations
- Features requiring compliance or security

**Skip for**:
- Very simple, well-understood tasks
- Bug fixes with clear reproduction
- Minor UI tweaks
- Internal refactoring

## Variations

### Lightweight Version
For simpler features, reduce to:
- Functional requirements
- Acceptance criteria
- Edge cases

### Technical-Focused Version
For backend/API work, emphasize:
- API contracts
- Data models
- Performance requirements
- Integration points

### UX-Focused Version
For frontend work, emphasize:
- User flows
- UI states
- Interactions
- Responsive behavior

## Related Patterns

- **Code Generation**: Use extracted requirements as input
- **Testing**: Generate tests from acceptance criteria
- **Context Inheritance**: Save requirements as project context

## Tips for Better Results

1. **Provide Real Context**: Use actual project details, not placeholders
2. **Include Examples**: Show similar existing features
3. **Be Specific About Tech**: Mention frameworks, libraries, constraints
4. **Iterate**: Review output and ask follow-up questions
5. **Validate with Stakeholders**: Share results for confirmation

## Next Steps

- Use this pattern for your next feature
- Adapt template to your domain
- Create project-specific variations
- Save successful versions for reuse
