---
name: review-plan
description: Reviews an implementation plan for gaps, inconsistencies, and over-engineering
---

When asked to review a plan:

1. Read the full plan carefully
2. Check for:
   - **Logical gaps** — are there steps missing between described states?
   - **Inconsistency** — does the plan contradict existing project patterns or architecture?
   - **Over-engineering** — does it solve problems that don't exist yet?
   - **Under-engineering** — are edge cases, error states, or scale ignored?
   - **Blind spots** — what assumptions need validation?
   - **Security** — does it handle auth, secrets, and user input safely?
3. Do NOT propose a new plan or fix issues
4. Write a concise report — one section per issue type
5. Rate confidence: High / Medium / Low
