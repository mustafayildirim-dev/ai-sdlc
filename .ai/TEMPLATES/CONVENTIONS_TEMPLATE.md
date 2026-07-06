# Coding Conventions

> AI-managed file. Updated whenever a new pattern or decision is established.

## Language & Frameworks

- **Language:** [e.g. Python 3.12]
- **Framework:** [e.g. FastAPI]
- **Testing:** [e.g. pytest 8.x]

## Naming Conventions

| Element | Convention | Example |
|---------|-----------|---------|
| Files | `snake_case` | `user_service.py` |
| Classes | `PascalCase` | `UserService` |
| Functions | `snake_case` | `get_user_by_id` |
| Variables | `snake_case` | `user_list` |
| Constants | `UPPER_SNAKE` | `MAX_RETRY_COUNT` |
| Routes | `kebab-case` | `/api/user-profiles` |

## Code Style

- Type hints required on all public functions
- Docstrings: Google style
- Line length: 88 characters
- Imports: stdlib → third-party → local (alphabetical within groups)

## Testing

- Test file: `tests/test_<module>.py`
- Test class: `Test<Name>`
- Test function: `test_<scenario>_<expected>`
- Prefer parametrized tests over multiple test functions

## Directory Structure

```
src/
  <domain>/
    __init__.py
    models.py
    service.py
    routes.py
tests/
```

## Verification Loop

Every change follows this closed loop:

```
Change → Verify (test/lint/type/build) → Read Result → Fix if failed → Repeat until all pass
```

- Run the full verification after **every** change, not at the end
- Read the output — do not assume it passed
- Fix the root cause, not the symptom
- If the loop runs 3+ times on the same change, stop and reassess

## Definition of Done

Every task must satisfy this checklist before it can be marked **completed**:

- [ ] Code is written and functionally complete
- [ ] All acceptance criteria (Given/When/Then) pass
- [ ] Unit/integration tests written and passing
- [ ] Linting and type checking pass with zero errors
- [ ] CHANGELOG.md updated with the change
- [ ] TASKS.md updated (task marked completed)
- [ ] CONVENTIONS.md followed (no violations)
- [ ] No known regressions introduced

A task that does not meet all criteria remains **in-progress** or **blocked**.

## Post-Mortem Process

When a significant incident occurs (production bug, major regression, data loss):

1. Open an incident entry in TASKS.md if not already tracked
2. Investigate root cause and document findings
3. Use the template at `.ai/TEMPLATES/POSTMORTEM_TEMPLATE.md` to write a post-mortem
4. Add prevention action items to TASKS.md
5. Update RISK.md if the incident reveals a new risk
6. Review and document lessons learned in DECISIONS.md
