# Prompt Structure Template

> Every prompt should follow this structure: **Goal + Constraints + Verification + Process**

## Template

```markdown
> **Goal:** [what to do — one sentence]
>
> **Constraints:**
> - Follow conventions in CONVENTIONS.md
> - Only modify: [list files or modules]
> - Do NOT touch: [list off-limits files/modules]
> - [any other constraints]
>
> **Verification:**
> - [command to test the change]
> - [command to lint the change]
> - [command to type-check the change]
>
> **Process:**
> 1. Propose your approach and list files you'll edit
> 2. Wait for my approval
> 3. Implement the changes
> 4. Run verification commands
> 5. Summarize: what changed, any risks, how to revert
```

## Examples

### Backend Feature

```
> **Goal:** Add input validation to POST /api/tasks
>
> **Constraints:**
> - Only modify src/routes/tasks.ts and src/validators/
> - No changes to test files unless currently failing
> - Do NOT touch .env or src/auth/
>
> **Verification:** npm run test && npm run lint && npm run typecheck
>
> **Process:** Propose approach first → wait for approval → implement → verify → summarize
```

### UI Change

```
> **Goal:** Add a dark mode toggle to the settings page
>
> **Constraints:**
> - Follow existing Tailwind color scheme in tailwind.config.ts
> - Only modify src/components/Settings/ and src/hooks/
> - Do NOT touch src/styles/globals.css
> - Before writing code, read src/components/ThemeToggle.tsx as reference pattern
>
> **Verification:** npm run dev (check visually) && npm run test
>
> **Process:** Propose first → implement → verify → summarize
```

## Why This Works

- **Goal** eliminates ambiguity
- **Constraints** prevent scope creep and protect off-limits code
- **Verification** closes the feedback loop automatically
- **Process** ensures the AI doesn't skip steps (plan → approve → code → verify)
