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

### `.ai/` Directory

| File | Purpose |
|------|---------|
| `RULES.md` | AI behavioral rules — reusable across projects |
| `WORKFLOW.md` | AI workflow process — reusable across projects (read every session) |
| `INITIATION.md` | Stage 0: Ideation & Initiation — only read during project setup |
| `CONVENTIONS.md` | Project conventions & terminology |
| `TEMPLATES/` | Starter templates for VISION.md, ADR, CONVENTIONS, GLOSSARY, opencode.json |
| `scripts/security_check.ps1` | Pre-commit secret scanner |
| `scripts/validate_refs.ps1` | Cross-reference link checker |
| `TEMPLATES/POSTMORTEM_TEMPLATE.md` | Post-incident analysis template |

## License

[MIT](LICENSE)
