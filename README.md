# AI-SDLC

**AI-Assisted Software Development Lifecycle** — A structured methodology for building production-grade software with AI assistance.

## What is AI-SDLC?

AI-SDLC is a complete SDLC adapted for human-AI collaboration. It solves three core problems:

1. **Lost context** — AI conversations are ephemeral; project knowledge disappears when the session ends
2. **Inconsistent quality** — Without structure, AI skips testing, documentation, and design
3. **Model lock-in** — Switching AI models resets everything; conventions don't transfer

## Quick Start

### Prerequisites

- An AI assistant (Claude, GPT, OpenCode, etc.)
- Git
- A text editor

### Setup (One-Time)

Copy the entire `.ai/` directory (containing RULES.md, WORKFLOW.md, INITIATION.md, and TEMPLATES/) into your new project.

### Starting a New Project

```
1. Write VISION.md               → 5 minutes
2. Tell AI: "Run the ideator"    → AI interviews you, creates PROJECT.md
3. Tell AI: "Initialize project" → AI scaffolds code, creates plans
4. Tell AI: "Implement X"        → AI follows workflow stages
```

No copy-paste needed. The AI reads RULES.md and WORKFLOW.md directly.

For full instructions, read **[AI_SDLC.md](./AI_SDLC.md)**.

## Techniques & Principles

### 🔄 Workflow

| Technique | Purpose |
|-----------|---------|
| **Stage Gate Model** | 6 stages with entry/exit criteria for quality control |
| **Stage Triggers** | Maps human commands to stages — 10 rules (RULES.md §7.1-7.10) |
| **Session Lifecycle** | Session open sequence, trigger mapping, close protocol |
| **Plan Mode** | Read-only exploration before any task — understand before touching |
| **Reverse Brief** | AI restates task understanding for human confirmation |
| **Acceptance Criteria (Given/When/Then)** | Testable conditions for every task |
| **Definition of Done** | 9-item completion checklist |

### ✅ Quality

| Technique | Purpose |
|-----------|---------|
| **Verification Loop** | Closed feedback cycle: Change → Verify → Fix → Repeat |
| **Adversarial Review** | AI self-critiques its own code for bloat, duplication, brittle abstractions, edge cases |
| **Empty Box Detection** | Anti-satisficing — catch superficial implementations that lack real functionality |
| **Self-Review Checklist** | 6 criteria: correctness, completeness, consistency, security, performance, 3-layer |
| **Three-Layer Consistency** | Verify Data / Controller / View layers are in sync after every change |
| **AI Plan Reviewer** | Second AI reviews plans for gaps, inconsistency, over-engineering |
| **AI Code Reviewer** | Second AI reviews code for bugs, error handling, test coverage, security |
| **Acceptance Walkthrough Scenarios** | Step-by-step user test scenarios written per task in planning; AI demonstrates in 3.4, human verifies independently in 4.2 |
| **User Verification Gate** | Present test scenarios to human and wait for feedback |
| **Functional Walkthrough** | AI demonstrates each acceptance criterion with evidence |

### 🔧 Debugging & Maintenance

| Technique | Purpose |
|-----------|---------|
| **Debugging Protocol** | Separate diagnosis from fixing in fresh conversations (D.1-D.4) |
| **Context Rot Management** | Prevent quality degradation in long sessions; fresh sessions for debugging |
| **Technical Debt Tracking** | Dedicated backlog in TASKS.md, reviewed every retrospective |
| **Post-Mortem Process** | Structured incident analysis using a template |
| **Migration Plan Requirement** | Schema changes require forward/rollback plan approved by human |

### 📚 Continuity & Documentation

| Technique | Purpose |
|-----------|---------|
| **Model Continuity System** | CONVENTIONS.md + TASKS.md + CHANGELOG.md enable seamless model switching |
| **Session Summary Protocol** | Mandatory summary at every session end |
| **ADR (Architecture Decision Records)** | Structured documentation of every decision |
| **Change Impact Tracing** | Scan all references before renaming, moving, or deleting files |
| **Cross-Reference Verification** | Auto-validate all .md file references |
| **Example File Reference Pattern** | Standard `file_path:line` format for all cross-references |
| **Prompt Structure** | Every prompt: Goal + Constraints + Verification + Process |

### 🔒 Security & Governance

| Technique | Purpose |
|-----------|---------|
| **Security Scan Gate** | Mandatory pre-commit secret scanning |
| **Git Branch Strategy** | feature/fix/docs/chore/explore branch model |
| **Conventional Commits** | feat/fix/docs/style/refactor/test/chore format — auto-applied at session end |
| **Session-End Auto-Commit** | Stage → security scan → Conventional Commit (auto). Push requires human approval |
| **Checkpoint Git Workflow** | `explore/` branches with checkpoint commits, squashed before merge |
| **Multi-Model Strategy** | Frontier/Standard/Light tier assignment per task type |

### 🧠 Meta-Process

| Technique | Purpose |
|-----------|---------|
| **Meta-Mode Awareness** | AI knows whether it is building the methodology or using it |
| **Question the Process** | AI is empowered to flag and suggest improvements to inefficient steps |

## System Files

### Project Root

| File | Purpose |
|------|---------|
| `VISION.md` | Product vision (you write this) |
| `README.md` | This file — entry point |
| `AI_SDLC.md` | Methodology manifesto & user guide |
| `CONTRIBUTING.md` | Contribution guidelines |
| `LICENSE` | MIT license |
| `AGENTS.md` | AI onboarding — read first in every session |
| `RISK.md` | Risk register — active, mitigated, closed risks |
| `MULTI_MODEL.md` | Multi-model strategy — which model for which task |

### `.ai/` Directory

| File | Purpose |
|------|---------|
| `RULES.md` | AI behavioral rules — reusable across projects (includes auto-commit at session end) |
| `WORKFLOW.md` | AI workflow process — reusable across projects (read every session) |
| `INITIATION.md` | Stage 0: Ideation & Initiation — only read during project setup |
| `CONVENTIONS.md` | Project conventions & terminology |
| `SKILLS.md` | Skills directory — AI reviewer skill documentation |
| `TEMPLATES/` | Starter templates: VISION.md, ADR, CONVENTIONS, GLOSSARY, CLAUDE.md, Cursor rules, MCP config, post-mortem, opencode.json, prompt structure, plan/code reviewer skills, migration plan, risk register |
| `scripts/security_check.ps1` | Pre-commit secret scanner |
| `scripts/validate_refs.ps1` | Cross-reference link checker |
| `TEMPLATES/POSTMORTEM_TEMPLATE.md` | Post-incident analysis template |
| `TEMPLATES/CLAUDE_TEMPLATE.md` | Claude Code config (references AGENTS.md) |
| `TEMPLATES/CURSOR_RULES_TEMPLATE.md` | Cursor IDE rules |
| `TEMPLATES/MCP_CONFIG_TEMPLATE.json` | MCP server configuration |
| `TEMPLATES/PROMPT_TEMPLATE.md` | Structured prompt format (Goal + Constraints + Verification + Process) |
| `TEMPLATES/REVIEWER_SKILL_TEMPLATE.md` | Plan/code reviewer skill templates |
| `TEMPLATES/MIGRATION_PLAN_TEMPLATE.md` | Schema migration plan template |
| `TEMPLATES/RISK_TEMPLATE.md` | Risk register starter format |

### `.claude/` Directory (Optional)

| File | Purpose |
|------|---------|
| `skills/review-plan/SKILL.md` | Plan reviewer skill — invoke with `/review-plan` |
| `skills/review-code/SKILL.md` | Code reviewer skill — invoke with `/review-code` |

## License

[MIT](LICENSE)
