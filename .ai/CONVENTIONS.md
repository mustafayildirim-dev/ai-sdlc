# Conventions

> Established conventions for this project. Updated continuously by the AI.

## Terminology

| Term | Meaning | Context |
|------|---------|---------|
| **Stage** | A step in the AI-SDLC workflow process (e.g., Stage 1: Planning, Stage 2: Design, Stage 3: Implementation, Stage 4: Review, Stage 5: Retrospective, Stage 6: Project Evaluation) | Used in WORKFLOW.md, RULES.md triggers |
| **Milestone** | A project-level deliverable with a target date (e.g., Milestone 1: Foundation, Milestone 2: Tools & Domains) | Used in ROADMAP.md, TASKS.md, PROJECT.md |
| **Step** | A sub-task within a workflow stage (e.g., Step 1.1, Step 2.1) | Used within WORKFLOW.md stage definitions |
| **Plan Mode** | A read-only exploration phase invoked before any non-trivial task. The AI investigates the codebase, analyzes the problem, and proposes an approach — without modifying any files. | WORKFLOW.md Plan Mode section, RULES.md 7.9 |
| **Verification Loop** | The closed feedback cycle: Change → Verify → Read Result → Fix → Repeat. Ensures the AI self-corrects without waiting for human feedback. | CONVENTIONS.md, WORKFLOW.md Step 3.3 |
| **Adversarial Review** | Self-critique of generated code for bloat, copy-paste, brittle abstractions, missing edge cases, and diff size. Identified issues are fixed or tracked as technical debt. | WORKFLOW.md Step 4.1, RULES.md 9.8 |
| **AI Plan Reviewer** | A second AI (or skill) that reviews an implementation plan for gaps, inconsistency, and over-engineering before any code is written. | WORKFLOW.md Step P.5, RULES.md 9.9 |
| **AI Code Reviewer** | A second AI (or skill) that reviews generated code for bugs, error handling, test coverage, and security. | WORKFLOW.md Step 3.5, RULES.md 9.9 |
| **Debugging Protocol** | Structured approach to diagnose-then-fix bugs: separate conversations for diagnosis and fixing, convergence check, never attempt the same fix twice. | WORKFLOW.md Debugging Protocol, RULES.md 9.10 |
| **Migration Plan** | A structured plan for schema changes: forward migration, rollback, app code changes, rollback strategy — must be approved before writing migration code. | WORKFLOW.md Step 2.3, RULES.md 6.6 |
| **Prompt Structure** | Four-element prompt format: Goal + Constraints + Verification + Process. | CONVENTIONS.md, .ai/TEMPLATES/PROMPT_TEMPLATE.md |
| **Three-Layer Consistency** | Verify Data/Controller/View layers are in sync after every feature change. | CONVENTIONS.md, WORKFLOW.md Step 4.1 |
| **Context Rot** | Degradation of AI reasoning quality in long sessions. Mitigated by fresh sessions for debugging, breaks after 60 messages / 30 edits, and explicit signaling. | WORKFLOW.md Session Lifecycle, RULES.md 5.6 |
| **Reverse Brief** | AI restates its understanding of a task (goal, edge cases, definition of done) for human confirmation before starting work. Catches misalignment early. | WORKFLOW.md Step 1.2 |
| **Functional Walkthrough** | AI demonstrates each acceptance criterion with evidence (request/response, UI state, CLI output) after implementation. | WORKFLOW.md Step 3.4 |
| **Session-End Auto-Commit** | AI stages all changes, runs security scan, writes a Conventional Commit, and commits at session end. Push requires human approval. Each commit represents one session's logical work unit. | RULES.md 6.7, WORKFLOW.md SESSION END |

### Rules

- **Never use "Phase" to refer to workflow stages or project milestones.** Use "Stage" for workflow steps and "Milestone" for project deliverables.
- In TASKS.md, group tasks under `## Milestone N — Title`.
- In CHANGELOG.md, use `### Milestone N — Title` for milestone completions.
- In ROADMAP.md, use `| Milestone | Title | Duration | ... |`.

## Acceptance Criteria Format

Every task in TASKS.md must include an **Acceptance Criteria** section using Given/When/Then format:

```markdown
### 4.1 Implement Inbox
- **Status:** pending
- **Acceptance Criteria:**
  - [ ] **Given** a user opens the inbox page, **when** no messages exist, **then** "No messages" placeholder is shown
  - [ ] **Given** a user composes a new message with valid fields, **when** they click send, **then** the message appears in the sent folder and the recipient's inbox
  - [ ] **Given** a user views a message, **when** they click delete, **then** the message moves to archive (not permanently deleted)
  - [ ] **Given** a user has 1000+ messages, **when** they open the inbox, **then** results are paginated (50 per page)
```

The criteria are written **during Stage 1 (Planning)** and validated **during Stage 3.3 (Verify)** and **Stage 3.4 (Functional Walkthrough)**. A task cannot be marked "completed" until all acceptance criteria pass.

## Empty Box Detection

Before marking any task complete, verify it has meaningful functional value. Surface-level implementations that only satisfy literal prompt wording but lack real behavior must be flagged and fixed. See RULES.md Rule 9.7.

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
- [ ] DoD checklist reviewed and confirmed

A task that does not meet all criteria remains **in-progress** or **blocked**.

## Verification Loop

Every change follows this closed loop:

```
Change → Verify (test/lint/type/build) → Read Result → Fix if failed → Repeat until all pass
```

The AI must **not** proceed to the next change until the current change passes all checks. The loop closes automatically when all gates pass. This is the core feedback mechanism for self-correcting AI development.

Key rules:
- Always run the full verification suite after every change, not at the end
- Read the output of each check — do not assume it passed
- If a check fails, fix the root cause, not the symptom
- If the loop runs 3+ times on the same change, stop and reassess the approach

## Three-Layer Consistency Check

Every change that touches a feature must be verified across three layers:

- **Data layer** — database schemas, migrations, models, types
- **Controller/Logic layer** — business logic, API handlers, state management
- **View/Presentation layer** — UI components, API responses, user-facing output

If any layer is modified, the other two must be checked for consistency. The check runs during Stage 4.1 (Self-Review).

## Prompt Structure

When asking the AI to perform a task, use this structure for clarity:

```
Goal: [what to do — one sentence]
Constraints: [files to touch, files to avoid, conventions to follow]
Verification: [commands to test, lint, type-check]
Process: [propose first → wait for approval → implement → verify → summarize]
```

See `.ai/TEMPLATES/PROMPT_TEMPLATE.md` for examples.

## Migration Plan Requirement

Any task involving schema changes (database migration, new fields, new models, API contract changes) MUST produce a migration plan before writing code:

1. Use `.ai/TEMPLATES/MIGRATION_PLAN_TEMPLATE.md`
2. Plan must include: forward migration, rollback, app code changes, rollback strategy
3. Plan must be approved by the human before writing any migration code

## Debugging Protocol

When a bug surfaces that the AI cannot fix in 1-2 attempts:

1. **Separate diagnosis from fixing** — never fix a bug that hasn't been correctly diagnosed
2. **Fresh context for fresh eyes** — start a new conversation for debugging
3. **Converge before committing** — if unsure, ask 2+ agents to diagnose independently

See WORKFLOW.md Debugging Protocol section for full process.

## Example File Reference Pattern

All cross-file references in documentation must follow this convention:

- **Code files:** `file_path:line` (e.g., `src/services/auth.ts:42`)
- **Documentation files:** `path relative to project root` (e.g., `.ai/WORKFLOW.md`)
- **Don't use:** absolute paths, URLs, or ambiguous names

This ensures any AI or developer can navigate the reference without guessing.

## Post-Mortem Process

When a significant incident occurs (production bug, major regression, data loss):

1. Open an incident entry in TASKS.md if not already tracked
2. Investigate root cause and document findings
3. Use the template at `.ai/TEMPLATES/POSTMORTEM_TEMPLATE.md` to write a post-mortem
4. Add prevention action items to TASKS.md
5. Update RISK.md if the incident reveals a new risk
6. Review and document lessons learned in DECISIONS.md
