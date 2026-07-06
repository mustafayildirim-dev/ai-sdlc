# AI-SDLC: AI-Assisted Software Development Lifecycle

> **Version 1.0** — A methodology for building production-grade software with AI assistance.

---

## Philosophy

AI-SDLC is not about replacing developers. It is about creating a structured partnership between human intent and machine execution. The core insight is simple:

**A great developer with a great tool beats a great developer with a mediocre tool. A structured process with a great AI beats an unstructured process with the same AI.**

Most AI-assisted projects fail not because the AI is incapable, but because the human does not know how to direct it effectively. AI-SDLC solves this by providing:

1. **A shared mental model** — Both human and AI know what to expect at each stage
2. **Persistence of context** — Knowledge survives across sessions and model switches
3. **Progressive elaboration** — Requirements start vague and become precise through structured iteration
4. **Built-in quality gates** — Every stage has entry and exit criteria

---

## Core Principles

| Principle | Description |
|-----------|-------------|
| **Human in the Loop** | The human makes strategic decisions; the AI executes tactical work |
| **Context First** | Every AI session starts by loading the full project context |
| **Document as You Go** | Documentation is not an afterthought; it is part of every task |
| **Iterative Refinement** | Requirements evolve through structured interviews, not guesswork |
| **Traceability** | Every decision has a recorded rationale (Architecture Decision Records) |
| **Model Agnostic** | The system works with any AI model; conventions ensure consistency across model switches |
| **Gate-Based Progress** | Work moves through defined stages with explicit completion criteria |
| **Plan Before Build** | Every non-trivial task starts with read-only exploration (Plan Mode) — understand before touching |
| **Verify as You Go** | Every change follows a closed feedback loop: change → verify → read result → fix → repeat (Verification Loop) |
| **Self-Critique** | AI reviews its own output for bloat, copy-paste, brittle abstractions, and edge cases (Adversarial Review) |
| **Diagnose Before Fix** | Debugging separates diagnosis from fixing — never fix a bug that hasn't been correctly diagnosed (Debug Protocol) |

---

## System Architecture

```
                        ┌─────────────────────────────────┐
                        │         HUMAN (You)              │
                        │   Strategic Direction, Review    │
                        └──────────┬──────────────────────┘
                                   │ Prompts
                                   ▼
┌──────────────────────────────────────────────────────────┐
│                    AI ASSISTANT                           │
│  Reads: RULES.md + WORKFLOW.md + PROJECT.md + Context    │
│  Writes: Code, Tests, Docs, TASKS.md, CHANGELOG.md       │
└──────────────────────────────────────────────────────────┘
                                   │
                                   ▼
┌──────────────────────────────────────────────────────────┐
│                 PROJECT ARTIFACTS                        │
├──────────────────────────────────────────────────────────┤
│  Static (Human-managed):                                 │
│  ├── VISION.md          ─  Why does this exist?          │
│  ├── RULES.md           ─  How should AI behave?         │
│  ├── WORKFLOW.md        ─  How should AI work?           │
│  ├── INITIATION.md      ─  How to get started?           │
│  └── PROJECT.md         ─  What are we building?         │
│                                                          │
│  Dynamic (AI-managed):                                   │
│  ├── ARCHITECTURE.md    ─  How is it designed?           │
│  ├── CONVENTIONS.md     ─  What patterns are established?│
│  ├── DECISIONS.md       ─  Why were decisions made?      │
│  ├── GLOSSARY.md        ─  What do terms mean?           │
│  ├── TASKS.md           ─  What should we do next?       │
│  ├── ROADMAP.md         ─  Where are we going?           │
│  ├── CHANGELOG.md       ─  What has changed?             │
│  └── README.md          ─  How does someone use this?    │
└──────────────────────────────────────────────────────────┘
```

### File Ownership and Lifecycle

| File | Owner | Created | Updated | Reusable? |
|------|-------|---------|---------|-----------|
| `VISION.md` | Human | Project start | As vision evolves | Template provided |
| `RULES.md` | Human (AI proposes) | Project start | Rarely | **Yes** — copy to new projects |
| `WORKFLOW.md` | Human (AI proposes) | Project start | Rarely | **Yes** — copy to new projects |
| `INITIATION.md` | Human (AI proposes) | Project start | Rarely | **Yes** — copy to new projects |
| `AI_SDLC.md` | Human | Project start | As methodology evolves | No |
| `PROJECT.md` | Human + AI | After ideation | Per milestone | No |
| `ARCHITECTURE.md` | AI | After initiation | Per significant change | No |
| `CONVENTIONS.md` | AI | After initiation | Continuously | No |
| `DECISIONS.md` | AI | After first decision | As decisions occur | No |
| `GLOSSARY.md` | AI | After initiation | As terms emerge | No |
| `TASKS.md` | AI | After initiation | Continuously | No |
| `ROADMAP.md` | AI | After initiation | Per milestone | No |
| `CHANGELOG.md` | AI | After first change | Per change | No |
| `README.md` | AI | After initiation | As needed | No |
| `opencode.json` | AI (scaffold) | After initiation | Rarely | Template provided |
| `CONTRIBUTING.md` | Human | Project start | As needed | No |
| `LICENSE` | Human | Project start | Never | No |
| `.gitignore` | Human | Project start | Rarely | No |
| `AGENTS.md` | Human | Project start | As needed | **Yes** — copy to new projects |
| `RISK.md` | AI | After initiation | Continuously | No |
| `MULTI_MODEL.md` | Human + AI | After initiation | Per milestone | **Yes** — copy to new projects |
| `.ai/scripts/security_check.ps1` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.ai/scripts/validate_refs.ps1` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.github/workflows/security.yml` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.github/workflows/validate.yml` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.ai/SKILLS.md` | AI | After initiation | As needed | Copy to projects |
| `.ai/TEMPLATES/PROMPT_TEMPLATE.md` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.ai/TEMPLATES/REVIEWER_SKILL_TEMPLATE.md` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.ai/TEMPLATES/MIGRATION_PLAN_TEMPLATE.md` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.ai/TEMPLATES/RISK_TEMPLATE.md` | AI (scaffold) | After initiation | Rarely | Copy to projects |
| `.claude/skills/review-plan/SKILL.md` | AI | After initiation | As needed | Copy to projects |
| `.claude/skills/review-code/SKILL.md` | AI | After initiation | As needed | Copy to projects |

---

## Quick Start: Your First AI-SDLC Project

### Step 1: Copy Reusable Files

Copy the entire `.ai/` directory — `RULES.md`, `WORKFLOW.md`, `INITIATION.md`, and `TEMPLATES/` — into your new project.

### Step 2: Create VISION.md

Copy `VISION_TEMPLATE.md` to your project root as `VISION.md` and fill in:
- What is the product? (elevator pitch)
- What problem does it solve?
- Who is it for?
- What makes it unique?
- How will you measure success?
- What are the constraints?

### Step 3: Run the Ideator

With VISION.md ready, open an AI conversation and say:

> **"Start a new project. I have a VISION.md ready. Run the ideator."**

The AI reads INITIATION.md, executes Step 0.2 (Ideation), and interviews you to build PROJECT.md. Answer its questions one at a time. Review and approve the final PROJECT.md.

### Step 4: Run the Initiator

With PROJECT.md approved, tell the AI:

> **"The PROJECT.md is approved. Initialize the project."**

The AI reads INITIATION.md, executes Step 0.3 (Initiation), and designs the architecture, creates plans, and scaffolds the codebase.

The AI will also ask if you want to publish to **GitHub**. If yes, create a repo on github.com and the AI will set up the remote and push. Review and approve all output.

### Step 5: Work Iteratively

For daily development, just tell the AI what to do:

> **"Implement the user login feature."**
> **"Fix the database connection error."**
> **"Add unit tests for the payment service."**

The AI reads RULES.md and WORKFLOW.md at session start, maps your command to the appropriate stage via Stage Triggers (RULES.md §7), and updates all documentation automatically.

### Step 6: Evaluate Project Health

Periodically check project integrity:

> **"Evaluate the project health."**
> **"Run a project audit."**

The AI executes **Stage 6 (Project Evaluation)** — file inventory, cross-reference audit, consistency checks, risk review, and a health score. Review and address the action items.

### Optional: Configure OpenCode

Create `opencode.json` in the project root to embed AI-SDLC instructions directly into the tool:

```json
{
  "instructions": [".ai/RULES.md", ".ai/WORKFLOW.md"]
}
```

A template is provided at `.ai/TEMPLATES/OPENCODE_CONFIG_TEMPLATE.json`. This ensures every OpenCode session starts with AI-SDLC active — no manual prompting needed.

---

## File Reference

### VISION.md

The "why." Defines the product's reason for existence. Written by the human before any AI interaction.

**Keep it:** Short (1-2 pages). Clear. Inspiring.
**Don't:** Include technical details or implementation specifics.

### PROJECT.md

The "what." Defines scope, features, technical stack, milestones, and success criteria. Created by the AI through the Ideator interview process. Approved by the human.

**Sections:**
- Product Overview
- Target Audience
- Core Features (MVP vs. Future)
- Technical Stack
- Milestones & Timeline
- Success Criteria & KPIs
- Known Risks & Mitigations

### RULES.md

The "how to behave." Immutable behavioral directives for the AI. Never modified without explicit human approval. Can be copied verbatim between projects.

### WORKFLOW.md

The "how to work." The step-by-step process the AI follows in every session. Includes session lifecycle, stage triggers, **Plan Mode** (read-only exploration), **AI Plan Review** (optional second-AI plan review), Stage 1-6 (Planning through Evaluation), verification loop, **AI Code Review** (optional), adversarial review, **functional walkthrough**, **debugging protocol**, **migration plan** requirement, **context rot** management, **three-layer consistency** check, checkpoint git workflow, and technical debt tracking. Read every session after initialization.

### INITIATION.md

The "how to get started." Used only once per project. Contains Stage 0: Ideation (interviewing the human to create PROJECT.md) and Stage 0: Initiation (designing architecture, planning, scaffolding). Read only when PROJECT.md does not exist.

### ARCHITECTURE.md

The "how it's designed." System architecture, component diagrams, data flow, API design, deployment model. Created by the AI during project initiation. Updated when significant architectural changes occur.

### CONVENTIONS.md

The "what we agreed on." Coding conventions, naming patterns, testing patterns, component structures, and stylistic decisions. Updated continuously as the project evolves. This file is the key to **model continuity** — when a new model takes over, it reads this file to match the existing style.

### DECISIONS.md (ADR)

Architecture Decision Records. Each entry records:
- **Date:** When the decision was made
- **Decision:** What was decided
- **Context:** Why this decision was needed
- **Options:** Alternatives considered
- **Rationale:** Why this option was chosen
- **Consequences:** What this decision means for the future

### GLOSSARY.md

Domain-specific terminology. Ensures the AI uses consistent language throughout the project. Especially important for industry-specific terms, acronyms, and internal naming.

### TASKS.md

The active task list. Contains:
- Current sprint/iteration tasks
- Backlog items
- Task status (pending, in-progress, completed, blocked, cancelled)
- Priority assignments
- **Acceptance Criteria** per task (Given/When/Then format) — defined during Stage 1 (Planning), validated during Stage 3 (Implementation) and Stage 4 (Review)
- **Technical Debt** section — tracks shortcuts, workarounds, and deprecated patterns for scheduled resolution

### ROADMAP.md

Long-term strategic plan. Contains milestones, estimated timelines, and dependencies. Updated at the end of each milestone.

### CHANGELOG.md

Chronological record of meaningful changes. Follows [Keep a Changelog](https://keepachangelog.com/) convention. Updated by the AI after every change.

### AGENTS.md

The "welcome mat." Provides a quick-start guide for new AI models or developers joining the project. Lists key files to read first, project overview, and critical context. Read at the start of every session before any other file.

### RISK.md

The "what could go wrong." Tracks project risks with probability, impact, mitigation, and status. Maintained continuously — updated when new risks emerge, risks materialize, or mitigations change.

### MULTI_MODEL.md

The "which model for which job." Provides a tiered model strategy — frontier models for architecture and security, standard models for feature work, light models for boilerplate and exploration. Helps optimize cost and quality across different task types. See also: Plan Mode (read-only exploration before committing to a model tier).

### README.md

The public face of the project. Contains setup instructions, usage examples, and contribution guidelines. Updated as the project evolves.

---

## Stage Gate Model

```
┌─────────────────────────────────────────────────────────────────┐
│                    ITERATION LIFECYCLE                          │
│                                                                 │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐   │
│  │ PLANNING │──▶│  DESIGN  │──▶│   CODE   │──▶│  REVIEW  │──▶│
│  └──────────┘   └──────────┘   └──────────┘   └──────────┘   │
│       │              │              │              │           │
│       ▼              ▼              ▼              ▼           │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐   │
│  │  Select   │   │  Update  │   │  Write   │   │ Self-    │   │
│  │  Tasks    │   │  ADR +   │   │  Tests   │   │ Review + │   │
│  │  Update   │   │  Arch    │   │  Follow  │   │ Quality  │   │
│  │  ROADMAP  │   │  Design  │   │  Conv.   │   │  Gates   │   │
│  └──────────┘   └──────────┘   └──────────┘   └──────────┘   │
│                                                                 │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                   RETROSPECTIVE                             │ │
│  │  Review metrics, update conventions, improve process       │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                 │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                STAGE 6: EVALUATION                          │ │
│  │  File inventory, cross-ref audit, risk review, health score│ │
│  └────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
```

### Gate Criteria

**Planning → Design**
- [ ] Tasks are selected and assigned
- [ ] Architectural impact is assessed
- [ ] Dependencies are identified

**Design → Code**
- [ ] Architecture decisions are documented (DECISIONS.md)
- [ ] ARCHITECTURE.md is updated if needed
- [ ] Implementation approach is reviewed

**Code → Review**
- [ ] All new code has tests
- [ ] Linting and type checks pass
- [ ] CONVENTIONS.md is followed

**Review → Retrospective**
- [ ] Code is committed
- [ ] CHANGELOG.md is updated
- [ ] TASKS.md is updated
- [ ] All quality gates passed

**Retrospective → Evaluation**
- [ ] Retrospective notes recorded in DECISIONS.md
- [ ] Process improvements proposed to human
- [ ] ROADMAP.md and TASKS.md updated
- [ ] New risks documented

**Evaluation Done**
- [ ] Cross-references validated
- [ ] Consistency checks passed
- [ ] Risk register reviewed
- [ ] Health score reported

---

## Model Continuity System

One of AI-SDLC's key innovations is maintaining consistency even when the underlying AI model changes. This is critical for teams using services like OpenCode where free-tier quotas may cause model switches mid-project.

### How It Works

```
┌──────────────────────────────┐
│   Session N (Model A)        │
│                              │
│  End of Session:             │
│  1. Update CONVENTIONS.md    │
│  2. Update TASKS.md          │
│  3. Update CHANGELOG.md      │
│  4. Write session summary    │
└──────────┬───────────────────┘
           │
           ▼
┌──────────────────────────────┐
│   Session N+1 (Model B)      │
│                              │
│  Start of Session:           │
│  1. Read RULES.md            │
│  2. Read WORKFLOW.md         │
│  3. Read PROJECT.md          │
│  4. Read CONVENTIONS.md      │
│  5. Read TASKS.md            │
│  6. Read CHANGELOG.md        │
│  7. Read INITIATION.md (if   │
│     PROJECT.md doesn't exist)│
│  8. Continue seamlessly      │
└──────────────────────────────┘
```

### Key Files for Continuity

| File | Why It Matters for Model Switching |
|------|------------------------------------|
| `CONVENTIONS.md` | Records all coding patterns so the new model matches exactly |
| `TASKS.md` | Tells the new model exactly what needs to be done next |
| `CHANGELOG.md` | Provides the recent history so the new model understands what has already been built |
| `DECISIONS.md` | Prevents the new model from re-litigating already-settled decisions |
| `ARCHITECTURE.md` | Gives the new model the full system picture |

---

## Git & GitHub Integration

### Branch Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Production-ready code |
| `develop` | Integration branch |
| `feature/<name>` | Feature work (branched from `develop`) |
| `fix/<name>` | Bug fixes (branched from `develop`) |
| `docs/<name>` | Documentation changes |

### Commit Convention (Conventional Commits)

```
<type>: <short description>

[optional body]

[optional footer]
```

| Type | Usage |
|------|-------|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation changes |
| `style` | Code style changes (formatting, etc.) |
| `refactor` | Code restructuring |
| `test` | Adding or updating tests |
| `chore` | Build process, dependencies, etc. |

### Workflow

```
git checkout -b feature/my-feature develop
# ... work with AI ...
git add .
git commit -m "feat: add user authentication"
git push origin feature/my-feature
# Create PR on GitHub
```

---

## Risk Management

### Risk Register

Risks are tracked in `RISK.md` with:

| ID | Risk | Probability | Impact | Mitigation | Status |
|----|------|-----------|--------|------------|--------|
| R-001 | Third-party API deprecation | Medium | High | Abstract API layer, monitor changelogs | Active |

See `.ai/TEMPLATES/RISK_TEMPLATE.md` for the full format. During initiation (Stage 0.2), initial risks from PROJECT.md are transferred to RISK.md.

### Review Cadence

- **Weekly**: Check active risks, identify new risks
- **Milestone**: Full risk review, update mitigations
- **Retrospective**: Lessons learned, risk process improvements

---

## Metrics & KPIs

### Project Health Metrics

| Metric | How to Measure | Target |
|--------|---------------|--------|
| Task Completion Rate | Tasks completed / Tasks planned | >80% per iteration |
| Documentation Coverage | Documents updated vs. changes made | 100% |
| Test Coverage | Lines covered / Total lines | >80% |
| Code Quality | Lint errors, type errors | 0 |

### Tracking

TASKS.md tracks completion. CHANGELOG.md tracks changes. The Retrospective stage reviews metrics and identifies improvements.

---

## Troubleshooting

### "The AI keeps forgetting what we decided."

**Solution:** Make sure DECISIONS.md is comprehensive. Every time you make a decision, ask the AI to record it. At the start of each session, ensure the AI reads DECISIONS.md first.

### "The AI writes code that doesn't match our style."

**Solution:** Update CONVENTIONS.md with explicit examples. Include code snippets showing the preferred patterns. The AI should read CONVENTIONS.md at the start of every session.

### "We switched models and the new one doesn't understand what was built."

**Solution:** This is exactly what AI-SDLC prevents. Run the startup sequence: read RULES.md, WORKFLOW.md, PROJECT.md, CONVENTIONS.md, TASKS.md, CHANGELOG.md, ARCHITECTURE.md, DECISIONS.md, and INITIATION.md (if PROJECT.md doesn't exist) before starting any work.

### "The project scope keeps growing."

**Solution:** Review PROJECT.md together. Update it explicitly. Any scope change requires a PROJECT.md update first, then TASKS.md. Never let the AI start work on something not in TASKS.md.

### "I don't know what the AI is working on."

**Solution:** Check TASKS.md. If it's not there, the AI shouldn't be working on it. At the end of every session, the AI should update TASKS.md with what was done and what's next.

---

## FAQ

**Q: Can I use AI-SDLC with any AI tool?**
A: Yes. The system is designed to be model-agnostic. It works with Claude, GPT, OpenCode, and any other conversational AI that can read files and execute commands.

**Q: Do I need to create all the files manually?**
A: No. VISION.md is the only file you need to write. RULES.md, WORKFLOW.md, and INITIATION.md are copied from the template. The rest are created by the AI during the Ideator and Initiator stages.

**Q: How long does setup take?**
A: Copying `.ai/` to a new project takes 1 minute. Each new project takes 1-2 hours for the Ideator + Initiator stages.

**Q: Can multiple developers use this system?**
A: Yes. The system is designed for teams. The documentation provides a shared context that all team members and AI assistants operate from.

**Q: What if I don't like how the AI structured something?**
A: You approve every AI output before it's finalized. The Ideator presents PROJECT.md for review. The Initiator presents the architecture and plan. You always have the final say.

---

## Appendix: File Templates

### VISION.md Minimum Content

```markdown
# Product Vision

## Elevator Pitch
...

## Problem Statement
...

## Target Audience
...

## Core Value Proposition
...

## Success Criteria (KPIs)
...

## Future Vision (1-3 years)
...

## Key Constraints
...
```

### ADR Entry Template

See `.ai/TEMPLATES/ADR_TEMPLATE.md`.

Additional templates available in `.ai/TEMPLATES/`:
- `CONVENTIONS_TEMPLATE.md` — coding conventions starter (includes Stage/Milestone terminology rule)
- `GLOSSARY_TEMPLATE.md` — glossary starter
- `POSTMORTEM_TEMPLATE.md` — structured post-incident analysis
- `CLAUDE_TEMPLATE.md` — Claude Code configuration (references AGENTS.md)
- `CURSOR_RULES_TEMPLATE.md` — Cursor IDE rules (.cursor/rules/ format)
- `MCP_CONFIG_TEMPLATE.json` — Model Context Protocol server configuration
- `OPENCODE_CONFIG_TEMPLATE.json` — OpenCode integration
- `PROMPT_TEMPLATE.md` — structured prompt format (Goal + Constraints + Verification + Process)
- `REVIEWER_SKILL_TEMPLATE.md` — plan-review and code-review skill templates for `.claude/skills/`
- `MIGRATION_PLAN_TEMPLATE.md` — schema migration plan template
- `RISK_TEMPLATE.md` — risk register starter format

---

*AI-SDLC v1.0 — Build better software, with AI as your partner.*
