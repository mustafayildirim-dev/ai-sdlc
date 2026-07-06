# Plan Reviewer Skill

> Place this in `.claude/skills/review-plan/SKILL.md` (Claude Code) or equivalent for other tools.
> Invoke with: `/review-plan`

```markdown
---
name: review-plan
description: Reviews an implementation plan for gaps, inconsistencies, and over-engineering
---

When asked to review a plan:

1. Read the full plan carefully
2. Check for:
   - **Logical gaps** — are there steps missing between described states?
   - **Inconsistency** — does the plan contradict existing project patterns or architecture?
   - **Over-engineering** — does the plan solve problems that don't exist yet?
   - **Under-engineering** — are edge cases, error states, or scale considerations ignored?
   - **Blind spots** — what assumptions does the plan make that should be validated?
   - **Security** — does the plan handle auth, secrets, and user input safely?
3. Do NOT propose a new plan or fix the issues
4. Write a concise report of findings — one section per issue type
5. Rate confidence: High / Medium / Low
```

# Code Reviewer Skill

> Place this in `.claude/skills/review-code/SKILL.md` (Claude Code) or equivalent for other tools.
> Invoke with: `/review-code`

```markdown
---
name: review-code
description: Reviews generated code for bugs, error handling, test coverage, and security
---

When asked to review code changes:

1. Read the plan and the generated code
2. Check for:
   - **Bugs** — logic errors, off-by-one, race conditions, null references
   - **Error handling** — are all failure paths handled? API errors, missing data, invalid input?
   - **Test coverage** — are there unit tests? Integration tests? Do tests cover edge cases?
   - **Security** — hardcoded secrets? Unsanitized input? Missing access control? CORS misconfig?
   - **Duplicate code** — repeated patterns that should be extracted
   - **New dependencies** — any new packages? Are they necessary? Any hallucinated package names?
   - **API changes** — any renamed endpoints, changed signatures, modified contracts?
   - **Schema changes** — any migration without rollback? Any breaking data changes?
3. Do NOT fix the issues — only report them
4. Write a report with:
   - Issues found (prioritized: critical/major/minor)
   - For each issue: file, line, description, suggested fix approach
   - Any areas the review could not cover and why
```
