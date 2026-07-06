# AI Development Workflow

> **Meta-project notice:** This file is a DELIVERABLE of the AI-SDLC methodology project. It is NOT an instruction set for the AI building this methodology. In a user project, copy this file into `.ai/` and it will serve as the AI workflow process.
>
> The step-by-step process the AI follows during project execution.
> Copy this file to every new AI-SDLC project. Adjust stage details as needed per project.

---

## Session Lifecycle

Every AI session follows this lifecycle:

```
┌─────────────────────────────────────────────────────┐
│                 SESSION START                        │
│  Read: AGENTS.md, RULES.md, WORKFLOW.md, PROJECT.md, │
│  CONVENTIONS.md, TASKS.md, CHANGELOG.md,             │
│  ARCHITECTURE.md, DECISIONS.md                       │
│  (Also read INITIATION.md if PROJECT.md doesn't exist)│
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
│           TRIGGER (map human request to stage)       │
│                                                      │
│  "start a project" / "ideate"  →  INITIATION.md     │
│  "initiate" / "initialize"     →  INITIATION.md     │
│  "analyze" / "explore" / "plan this" →  Plan Mode   │
│  "implement X" / "fix Y"       →  Stage 1 → 4       │
│  Other development task        →  Stage 1 → 4       │
└───────────────────┬─────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────┐
│           EXECUTE (follow triggered stage)           │
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


### Context Rot Management

AI sessions degrade in quality as context grows. Follow these guidelines:

1. **Complex debugging** → always start a new conversation (see Debugging Protocol)
2. **Long sessions** (60+ messages or 30+ file edits) → summarize progress, ask if you should start a fresh session
3. **Architecture discussion** → move to new session after 15-20 messages
4. **If you feel uncertain** → you probably have context rot. Ask the human to start fresh.
5. **Signs of rot**: repeating questions, forgetting earlier decisions, proposing contradictory changes, slower responses

---

## Plan Mode: Read-Only Exploration

*Invoked when the human says **"analyze"**, **"explore"**, **"plan this"**, or before any non-trivial task.*

A read-only investigation phase. The AI explores the codebase, analyzes the problem, and proposes an approach — without modifying a single file.

### Entry Criteria
- [ ] Project is initialized (PROJECT.md exists)
- [ ] A concrete question or task is defined

### Process

```
Step P.1: Understand the Request
  ├── Read the task description or question
  ├── Clarify scope with the human if ambiguous
  └── Identify which parts of the codebase are relevant

Step P.2: Explore the Codebase
  ├── Read relevant files (ROADMAP.md, TASKS.md, DECISIONS.md, ARCHITECTURE.md)
  ├── Read source files affected by the task
  ├── Identify current behavior, interfaces, data flow
  └── Note potential risks, edge cases, and unknowns

Step P.3: Formulate a Plan
  ├── Outline the implementation approach
  ├── List files that will be created or modified
  ├── Identify test scenarios
  ├── Estimate effort (S/M/L)
  └── Note any architectural decisions that must be made

Step P.4: Present to Human
  ├── Summarize findings (2-3 sentences)
  ├── Present the plan with file list and approach
  ├── Highlight risks or open questions
  └── Wait for human approval before touching any file

Step P.5: AI Plan Review (optional but recommended)
  ├── Invoke a second AI instance (or skill) to review the plan:
  │   ├── "/review-plan — check for logical gaps, inconsistency, over-engineering"
  │   ├── Review report comes back — do NOT modify the plan yet
  │   └── Share report with human: "The reviewer flagged [issues]. Should we address them?"
  ├── Address confirmed issues → update plan
  └── Re-present to human if plan changed significantly
```

### Exit Criteria
- [ ] Codebase exploration complete
- [ ] Clear implementation plan presented
- [ ] Plan reviewed (optional: second AI review completed)
- [ ] Human approves (or redirects)
- [ ] No files were modified

### Trigger Integration

When the human says "analyze X" or "explore Y", enter Plan Mode. After the plan is approved, proceed to **Stage 1 (Planning)** for task selection, or directly to **Stage 2 (Design)** if the task is already well-defined.

---

## Stage 1: Planning

*At the start of each iteration.*

### Entry Criteria
- [ ] Project is initialized (INITIATION.md stage is complete)
- [ ] TASKS.md has backlog items or milestones defined

### Process

```
Step 1.1: Review Current State
  ├── Read AGENTS.md (project overview, key files)
  ├── Read PROJECT.md (confirm scope hasn't changed)
  ├── Read ROADMAP.md (check milestone progress)
  ├── Read TASKS.md (check current task status)
  ├── Read CHANGELOG.md (review recent changes)
  └── Read DECISIONS.md (understand recent decisions)

Step 1.2: Plan This Iteration
  ├── Identify the next milestone target
  ├── Select tasks for this iteration from TASKS.md
  ├── Reverse Brief (for each selected task):
  │   ├── "What I understand: [goal, expected behavior, key edge cases, what done looks like]"
  │   ├── "Key decisions I see: [list of design choices I plan to make]"
  │   └── Human confirms or clarifies → repeat until aligned ← VALIDATION GATE
  ├── For each task, add or verify Acceptance Criteria in TASKS.md (Given/When/Then format)
  ├── For each task, classify user-verify need:
  │   ├── User-facing change (UI/UX, copy, behavior) → plan test scenarios
  │   ├── Business logic change (rules, calculations) → plan test scenarios
  │   ├── Bug fix → plan reproduction + confirmation steps
  │   └── Infra / refactor / backend-only → no user verify needed
  ├── If user-verify needed, add "Verify with user" sub-task to TASKS.md
  ├── Group related tasks into check-points for targeted user testing between milestones
  ├── Assess architectural impact of selected tasks
  ├── Identify dependencies and risks
  └── Present plan to human for approval
```

### Exit Criteria
- [ ] Iteration tasks are selected and assigned in TASKS.md
- [ ] Reverse Brief completed and confirmed by human
- [ ] Acceptance criteria defined (Given/When/Then) for each selected task
- [ ] Plan is reviewed and approved by human
- [ ] Dependencies and risks are identified

---

## Stage 2: Design

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
  ├── Identify test scenarios
  └── If the task involves schema changes (DB migration, new fields, new models):
      ├── Produce a Migration Plan using `.ai/TEMPLATES/MIGRATION_PLAN_TEMPLATE.md`
      ├── Include: forward migration (up), rollback (down), app code changes, rollback strategy
      └── Present the plan to human for approval BEFORE writing any migration code
```

### Exit Criteria
- [ ] All new architecture decisions documented in DECISIONS.md
- [ ] ARCHITECTURE.md updated if needed
- [ ] Implementation approach is clear
- [ ] Test scenarios are identified

---

## Stage 3: Implementation

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

Step 3.3: Verify (Verification Loop)
  ├── Run linter → fix all issues
  ├── Run type checker → fix all issues
  ├── Run tests → fix all failures
  ├── Run build/dev server → confirm it works
  ├── Validate each acceptance criterion from TASKS.md — one by one, with evidence
  └── Loop: if any check fails, fix → re-verify → repeat until all pass
      (The verification loop closes automatically: change → check → read result → fix → repeat)

Step 3.4: Functional Walkthrough
  ├── For each implemented task, demonstrate the behavior:
  │   ├── "I started the server and tested [endpoint/feature]. Actual result:"
  │   ├── Show request/response, UI state, or CLI output
  │   ├── Walk through each acceptance criterion, confirming pass/fail
  │   └── If behavior does not match → fix before proceeding
  ├── For user-facing changes: prepare walkthrough scenarios for human review
  ├── Note any assumptions made during implementation
  └── Record implementation decisions in DECISIONS.md

Step 3.5: AI Code Review (optional but recommended)
  ├── Invoke a second AI instance (or skill) to review the changes:
  │   ├── "/review-code — check for bugs, error handling, test coverage, security"
  │   ├── Review report comes back — do NOT fix anything yet
  │   └── Share report with human: "The reviewer found [issues]. Should we address them?"
  ├── Address confirmed issues:
  │   ├── Fix critical and major issues immediately
  │   └── Add minor issues as technical debt in TASKS.md
  └── Re-run verification loop after fixes
```

### Exit Criteria
- [ ] All selected tasks are implemented
- [ ] All acceptance criteria pass (verified)
- [ ] Functional walkthrough completed
- [ ] Tests pass
- [ ] Linting and type checking pass
- [ ] No breaking changes without documentation
- [ ] (Optional) AI code review completed and issues resolved

---

## Stage 4: Review

*Quality assurance and documentation.*

### Entry Criteria
- [ ] Implementation is complete
- [ ] Tests pass

### Process

```
Step 4.1: Self-Review
  ├── Standard review:
  │   ├── Correctness (does it work?)
  │   ├── Completeness (does it cover edge cases? is it more than a skeleton?)
  │   ├── Acceptance criteria: every task's criteria are met (check TASKS.md)
  │   ├── Consistency (does it match project conventions?)
  │   ├── Security (any vulnerabilities?)
  │   ├── Performance (any obvious issues?)
  │   └── Three-Layer Consistency Check:
  │       ├── Data layer — are database schemas, models, migrations updated?
  │       ├── Controller/Logic layer — is the business logic updated?
  │       └── View/Presentation layer — is the UI or API response updated?
  └── Adversarial Review (critique your own code):
      ├── Bloat check — is there dead code, over-engineered abstractions, unused imports?
      ├── Copy-paste check — are there repeated patterns that should be extracted?
      ├── Abstraction check — are abstractions brittle (leaky, over-general, wrong level)?
      ├── Edge-case check — are error paths, empty states, boundary conditions handled?
      ├── Diff-size check — is the diff larger than expected? Could it be smaller?
      └── For each issue found: fix it OR add a technical debt entry to TASKS.md

Step 4.2: User Verification Gate (if user-verify sub-tasks exist)
  ├── Check TASKS.md for pending "Verify with user" sub-tasks
  ├── Prepare specific test scenarios for each user-facing change
  │   ├── "Try clicking X, expect Y to happen"
  │   ├── "Enter Z input, expect W output"
  │   └── "Confirm this matches the expected behavior from PROJECT.md"
  ├── Present scenarios to human: "Please test these and share feedback"
  ├── Wait for feedback before marking completion
  └── If feedback reveals issues → loop back to Stage 2/3

Step 4.3: Update Documentation
  ├── Update CHANGELOG.md (add entry for this change)
  ├── Update CONVENTIONS.md (if new patterns emerged)
  ├── Update GLOSSARY.md (if new terms were introduced)
  ├── Update README.md (if setup/usage changed)
  └── Update TASKS.md (mark tasks as completed)

Step 4.4: Security Scan
  ├── Run `.ai/scripts/security_check.ps1` on staged files
  ├── If secrets detected → BLOCK commit, flag to human
  └── If clean → proceed

Step 4.5: Prepare for Commit
  ├── Review the diff (git diff)
  ├── Confirm no secrets or debug code
  ├── Write commit message (Conventional Commits format)
  └── Present changes to human for approval

Step 4.6: Cross-Reference Verification
  ├── Search all .md files for references to changed files
  ├── Verify all references are correct and consistent
  └── Fix any broken or outdated references

Step 4.7: Post-Mortem (if applicable)
  ├── If a significant incident occurred (production bug, major regression):
  │   ├── Use `.ai/TEMPLATES/POSTMORTEM_TEMPLATE.md` to document
  │   ├── Add prevention action items to TASKS.md
  │   ├── Update RISK.md if incident reveals a new risk
  │   └── Record lessons learned in DECISIONS.md
  └── Otherwise → skip
```

### Exit Criteria
- [ ] All documentation is updated
- [ ] Changes presented to human for review
- [ ] Human approves or requests changes

---

## Stage 5: Retrospective

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
  ├── Identify context-window inefficiencies (files read unnecessarily)
  ├── Suggest file restructuring if read patterns are suboptimal
  ├── Update CONVENTIONS.md with lessons learned
  ├── Update PROJECT.md if scope has shifted
  ├── Update ROADMAP.md based on learnings
  ├── Review technical debt backlog (see Tech Debt section in TASKS.md)
  │   ├── Add new tech debt items discovered during the iteration
  │   ├── Schedule high-priority items for upcoming milestones
  │   └── Close items that were resolved
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

## Debugging Protocol

*When a bug surfaces that the AI cannot fix in 1-2 attempts, follow this protocol instead of repeating the same loop.*

### Principles

1. **Separate diagnosis from fixing** — never let the AI fix a bug it hasn't correctly diagnosed
2. **Fresh context for fresh eyes** — start a new conversation for debugging to avoid context rot
3. **Converge before committing** — if unsure, ask 2+ agents to diagnose independently

### Process

```
Step D.1: Detect
  ├── A test fails, a feature doesn't work, or the human reports unexpected behavior
  └── If the current AI has tried 2+ fixes without success → STOP and escalate

Step D.2: Diagnose (in a new conversation)
  ├── Start a fresh session (use /clear or open new conversation)
  ├── Prompt: "Just diagnose, don't fix. Investigate [issue]. Report root cause only."
  ├── Provide: relevant error messages, file paths, current behavior vs expected behavior
  └── Do NOT write any code — only investigate and report

Step D.3: Converge
  ├── If the diagnosis is uncertain, ask a second AI agent the same question
  ├── Compare diagnoses:
  │   ├── If they converge → proceed to fix
  │   └── If they diverge → investigate further, provide more context
  └── Share the diagnosis with the human for confirmation

Step D.4: Fix (in another new conversation)
  ├── Start another fresh session (diagnosis context should NOT bleed into fix)
  ├── Prompt: "Here is the diagnosis: [root cause]. Fix it. Follow the standard workflow."
  ├── After fix → run verification loop
  └── If the fix doesn't work → go back to Step D.2 (re-diagnose)
```

### Rules
- Never attempt the same fix more than twice — if it fails twice, the diagnosis is likely wrong
- Always start a new conversation for diagnosis — context from implementation sessions corrupts debugging
- Commit the current state before debugging so you can roll back if needed

---

## Stage 6: Project Evaluation

*Project health assessment and integrity audit. Can be run at any time — not just at milestone boundaries.*

### Trigger
- Human says **"evaluate"**, **"health check"**, **"project audit"**, **"project status"**
- After milestone completion (auto-suggest)
- After 10+ sessions without one (auto-suggest)

### Entry Criteria
- [ ] Project is initialized (PROJECT.md exists)

### Process

```
Step 6.1: File Inventory
  ├── Check all tracked files exist (against File Ownership table)
  ├── Verify no orphan files (tracked but undocumented)
  └── Flag missing or extra files

Step 6.2: Cross-Reference Audit
  ├── Run .ai/scripts/validate_refs.ps1 automatically
  └── Report all broken links

Step 6.3: Consistency Check
  ├── Compare ROADMAP.md vs TASKS.md vs CHANGELOG.md
  ├── Verify ARCHITECTURE.md matches current code
  ├── Check DECISIONS.md covers all architectural choices
  └── Flag inconsistencies

Step 6.4: Risk Review
  ├── Read RISK.md
  ├── Check if any risks materialized
  ├── Move materialized risks to Mitigated with outcome notes
  ├── Identify new risks and add to Active
  └── Update mitigations for existing Active risks

Step 6.5: Health Score
  ├── Score (1-10) per category:
  │   ├── Documentation coverage
  │   ├── Test coverage
  │   ├── Architecture alignment
  │   ├── Risk management
  │   └── Task completion rate
  └── Overall: 🟢 Green / 🟡 Yellow / 🔴 Red

Step 6.6: Action Items
  ├── List concrete next steps
  ├── Prioritize by impact/effort
  └── Present to human
```

### Exit Criteria
- [ ] File inventory complete
- [ ] Cross-references validated
- [ ] Consistency check done
- [ ] Risk register reviewed
- [ ] Health score reported
- [ ] Action items presented to human

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

### Checkpoint Workflow (Vibe / Rapid Prototyping)

For exploratory or high-iteration-rate work, use checkpoint commits to save every working state:

```
1. git checkout -b explore/<feature-name>
2. Make a change → verify it works → git commit -m "checkpoint: working state description"
3. Iterate: change → verify → checkpoint commit
4. After reaching a clean state:
   git checkout -b cleanup/<feature-name>
   git rebase -i HEAD~N   # squash checkpoint commits into logical units
   git commit -m "feat: final description"
5. Merge into develop when stable
```

Rules:
- Every checkpoint must represent a **working state** (tests may be incomplete, but code runs without crashes)
- Checkpoint messages are informal: `checkpoint: basic form renders`, `checkpoint: API returns data`
- Squash checkpoints before merging into develop — never push checkpoint history to shared branches
- If a checkpoint introduces a regression, `git reset --hard` back to the last good one (checkpoints are cheap to discard)

---

## Technical Debt Tracking

Technical debt (workarounds, shortcuts, deprecated patterns) is tracked in `TASKS.md` under a dedicated `## Technical Debt` section:

```markdown
## Technical Debt

| ID | Description | Added | Effort | Priority | Scheduled | Status |
|----|-------------|-------|--------|----------|-----------|--------|
| TD-1 | Replace hardcoded config with env vars | 2026-01-15 | S | Medium | Milestone 2 | pending |
| TD-2 | Migrate inline styles to CSS modules | 2026-02-01 | L | Low | — | pending |
```

- New debt items are added during **Stage 5 (Retrospective)** when the AI identifies shortcuts taken
- Items can also be added during **Stage 4 (Review)** if the AI notices debt during self-review
- High-priority items should be scheduled into upcoming milestones
- When debt is resolved, mark as `closed` and add resolution notes

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
