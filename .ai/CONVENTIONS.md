# Conventions

> Established conventions for this project. Updated continuously by the AI.

## Terminology

| Term | Meaning | Context |
|------|---------|---------|
| **Stage** | A step in the AI-SDLC workflow process (e.g., Stage 1: Planning, Stage 2: Design, Stage 3: Implementation, Stage 4: Review, Stage 5: Retrospective, Stage 6: Project Evaluation) | Used in WORKFLOW.md, RULES.md triggers |
| **Milestone** | A project-level deliverable with a target date (e.g., Milestone 1: Foundation, Milestone 2: Tools & Domains) | Used in ROADMAP.md, TASKS.md, PROJECT.md |
| **Step** | A sub-task within a workflow stage (e.g., Step 1.1, Step 2.1) | Used within WORKFLOW.md stage definitions |

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

## Post-Mortem Process

When a significant incident occurs (production bug, major regression, data loss):

1. Open an incident entry in TASKS.md if not already tracked
2. Investigate root cause and document findings
3. Use the template at `.ai/TEMPLATES/POSTMORTEM_TEMPLATE.md` to write a post-mortem
4. Add prevention action items to TASKS.md
5. Update RISK.md if the incident reveals a new risk
6. Review and document lessons learned in DECISIONS.md
