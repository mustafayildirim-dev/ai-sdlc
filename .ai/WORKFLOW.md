# AI Development Workflow

> **Meta-project notice:** This file is a DELIVERABLE of the AI-SDLC methodology project. It is NOT an instruction set for the AI building this methodology. In a user project, copy this file into `.ai/` and it will serve as the AI workflow process.
>
> The step-by-step process the AI follows during project execution.
> Copy this file to every new AI-SDLC project. Adjust phase details as needed per project.

---

## Session Lifecycle

Every AI session follows this lifecycle:

```
┌─────────────────────────────────────────────────────┐
│                 SESSION START                        │
│  Read: RULES.md, WORKFLOW.md, PROJECT.md,            │
│  CONVENTIONS.md, TASKS.md, CHANGELOG.md,             │
│  ARCHITECTURE.md, DECISIONS.md                       │
└───────────────────┬─────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────┐
│              ORIENT AND CONFIRM                      │
│  Summarize current state.                            │
│  Confirm task(s) for this session.                   │
└───────────────────┬─────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────┐
│           TRIGGER (map human request to phase)       │
│                                                      │
│  "start a project" / "ideate"  →  Phase 0.2         │
│  "initiate" / "initialize"     →  Phase 0.3         │
│  "implement X" / "fix Y"       →  Phase 1 → 4       │
│  Other development task        →  Phase 1 → 4       │
└───────────────────┬─────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────┐
│           EXECUTE (follow triggered phase)           │
└───────────────────┬─────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────┐
│                 SESSION END                          │
│  1. Update CONVENTIONS.md (new patterns)             │
│  2. Update CHANGELOG.md (what changed)               │
│  3. Update TASKS.md (mark complete, update status)   │
│  4. Write session summary                            │
└─────────────────────────────────────────────────────┘
```

---


---

## Phase 1: Planning

*At the start of each iteration.*

### Entry Criteria
- [ ] Project is initialized (Phase 0 is complete)
- [ ] TASKS.md has backlog items or milestones defined

### Process

```
Step 1.1: Review Current State
  ├── Read PROJECT.md (confirm scope hasn't changed)
  ├── Read ROADMAP.md (check milestone progress)
  ├── Read TASKS.md (check current task status)
  ├── Read CHANGELOG.md (review recent changes)
  └── Read DECISIONS.md (understand recent decisions)

Step 1.2: Plan This Iteration
  ├── Identify the next milestone target
  ├── Select tasks for this iteration from TASKS.md
  ├── Assess architectural impact of selected tasks
  ├── Identify dependencies and risks
  └── Present plan to human for approval
```

### Exit Criteria
- [ ] Iteration tasks are selected and assigned in TASKS.md
- [ ] Plan is reviewed and approved by human
- [ ] Dependencies and risks are identified

---

## Phase 2: Design

*Before writing any code, design the solution.*

### Entry Criteria
- [ ] Tasks for this iteration are selected and approved
- [ ] ARCHITECTURE.md and DECISIONS.md are loaded

### Process

```
Step 2.1: Analyze
  ├── For each selected task, determine:
  │   ├── Which components are affected
  │   ├── What new components are needed
  │   ├── How data flows through the change
  │   └── What interfaces change
  └── Identify any architectural decisions that need to be made

Step 2.2: Decide
  ├── For each new architecture decision:
  │   ├── Identify options
  │   ├── Evaluate tradeoffs
  │   ├── Document in DECISIONS.md (ADR format)
  │   └── Present to human if high-impact
  └── Update ARCHITECTURE.md if the design changes the documented architecture

Step 2.3: Plan Implementation
  ├── Break the task into sub-tasks
  ├── Determine the order of file creation/modification
  └── Identify test scenarios
```

### Exit Criteria
- [ ] All new architecture decisions documented in DECISIONS.md
- [ ] ARCHITECTURE.md updated if needed
- [ ] Implementation approach is clear
- [ ] Test scenarios are identified

---

## Phase 3: Implementation

*Write the code.*

### Entry Criteria
- [ ] Design is complete and documented
- [ ] Implementation plan is clear

### Process

```
Step 3.1: Read Conventions
  ├── Read CONVENTIONS.md
  ├── Examine existing similar files for patterns
  └── Confirm code style, naming, and structure

Step 3.2: Implement
  ├── Create/modify files according to the design
  ├── Follow existing patterns and conventions
  ├── Write tests alongside implementation (TDD preferred)
  ├── Keep changes focused on the task scope
  └── Commit early, commit often

Step 3.3: Verify
  ├── Run linter → fix all issues
  ├── Run type checker → fix all issues
  ├── Run tests → fix all failures
  └── Run build/dev server → confirm it works
```

### Exit Criteria
- [ ] All selected tasks are implemented
- [ ] Tests pass
- [ ] Linting and type checking pass
- [ ] No breaking changes without documentation

---

## Phase 4: Review

*Quality assurance and documentation.*

### Entry Criteria
- [ ] Implementation is complete
- [ ] Tests pass

### Process

```
Step 4.1: Self-Review
  ├── Review all changed files for:
  │   ├── Correctness (does it work?)
  │   ├── Completeness (does it cover edge cases?)
  │   ├── Consistency (does it match project conventions?)
  │   ├── Security (any vulnerabilities?)
  │   └── Performance (any obvious issues?)

Step 4.2: Update Documentation
  ├── Update CHANGELOG.md (add entry for this change)
  ├── Update CONVENTIONS.md (if new patterns emerged)
  ├── Update GLOSSARY.md (if new terms were introduced)
  ├── Update README.md (if setup/usage changed)
  └── Update TASKS.md (mark tasks as completed)

Step 4.3: Prepare for Commit
  ├── Review the diff (git diff)
  ├── Confirm no secrets or debug code
  ├── Write commit message (Conventional Commits format)
  └── Present changes to human for approval
```

### Exit Criteria
- [ ] All documentation is updated
- [ ] Changes presented to human for review
- [ ] Human approves or requests changes

---

## Phase 5: Retrospective

*Periodic reflection and improvement.*

### Trigger
- After a milestone is completed
- When the human requests it
- When 5+ sessions have passed without one

### Process

```
Step 5.1: Review What Happened
  ├── What tasks were completed / missed?
  ├── What went well?
  ├── What went wrong?
  ├── Were there any recurring issues?
  └── Review project metrics (test coverage, completion rate, etc.)

Step 5.2: Improve the Process
  ├── Propose improvements to WORKFLOW.md (if any)
  ├── Propose new rules for RULES.md (if any)
  ├── Update CONVENTIONS.md with lessons learned
  ├── Update PROJECT.md if scope has shifted
  ├── Update ROADMAP.md based on learnings
  └── Record key insights in DECISIONS.md

Step 5.3: Plan Ahead
  ├── Review ROADMAP.md and update if needed
  ├── Re-prioritize TASKS.md based on learnings
  ├── Identify new risks and document in PROJECT.md
  └── Confirm next milestone with human
```

### Exit Criteria
- [ ] Retrospective notes recorded in DECISIONS.md
- [ ] Process improvements proposed to human
- [ ] ROADMAP.md and TASKS.md updated
- [ ] New risks documented

---

## Git Workflow

### Branch Naming

| Pattern | Example |
|---------|---------|
| `feature/<short-description>` | `feature/user-authentication` |
| `fix/<short-description>` | `fix/login-error-handling` |
| `docs/<short-description>` | `docs/api-documentation` |
| `refactor/<short-description>` | `refactor/auth-service` |
| `chore/<short-description>` | `chore/update-dependencies` |

### Commit Flow

```
# After implementation + review:
git add <files>
git commit -m "feat: add user authentication with JWT"
git push origin feature/user-authentication
```

### Git Hygiene

- Keep commits small and atomic (one concern per commit)
- Write descriptive commit messages (what + why, not how)
- Never force-push to shared branches
- Rebase onto `develop` before creating a PR
- Delete feature branches after merging

---

## Task Status Convention

Tasks in TASKS.md follow these statuses:

| Status | Meaning |
|--------|---------|
| `pending` | Not yet started |
| `in-progress` | Actively being worked on |
| `completed` | Finished and verified |
| `blocked` | Cannot proceed due to dependency |
| `cancelled` | No longer needed |

---

## Session Summary Template

At the end of every session, write a summary:

```markdown
## Session Summary — YYYY-MM-DD

### What was accomplished:
- Task 1: ...
- Task 2: ...

### Decisions made:
- Decided to ... (see DECISIONS.md ADR-XXX)

### Files changed:
- `src/file1.js` — added feature X
- `src/file2.js` — refactored Y

### Current state:
- [x] Task A — completed
- [ ] Task B — in progress (50%)

### Next steps:
1. Complete Task B
2. Start Task C

### Blockers:
- None
```
