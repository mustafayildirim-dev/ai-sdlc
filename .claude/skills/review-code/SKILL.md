---
name: review-code
description: Reviews generated code for bugs, error handling, test coverage, and security
---

When asked to review code changes:

1. Read the plan and the generated code (or diff)
2. Check for:
   - **Bugs** — logic errors, off-by-one, race conditions, null references
   - **Error handling** — are all failure paths handled? API errors, missing data, invalid input?
   - **Test coverage** — unit tests? Integration tests? Do they cover edge cases?
   - **Security** — hardcoded secrets? Unsanitized input? Missing access control?
   - **Duplicate code** — repeated patterns that should be extracted
   - **New dependencies** — any unnecessary or hallucinated packages?
   - **API changes** — renamed endpoints, changed signatures, broken contracts
   - **Schema changes** — migration without rollback? Breaking data changes?
3. Do NOT fix the issues — only report them
4. Write a report with:
   - Issues found (critical / major / minor)
   - For each issue: file, line, description, suggested fix approach
   - Any areas the review could not cover and why
