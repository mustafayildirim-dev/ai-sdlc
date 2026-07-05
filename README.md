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

1. Copy `RULES.md` and `WORKFLOW.md` from `.ai/` into your new project's `.ai/` directory
2. Open `.ai/PROMPTS.md` when you need a prompt — copy the relevant section and paste into your AI conversation

### Starting a New Project

```
1. Write VISION.md          → 5 minutes (use the template in .ai/TEMPLATES/)
2. Copy Ideator from        → AI interviews you to create PROJECT.md
   .ai/PROMPTS.md
3. Copy Initiator from      → AI creates architecture, plan, and scaffolds code
   .ai/PROMPTS.md
4. Copy Template from       → AI executes tasks iteratively
   .ai/PROMPTS.md
```

For full instructions, read **[AI_SDLC.md](./AI_SDLC.md)**.

## System Files

### Project Root

| File | Purpose |
|------|---------|
| `VISION.md` | Product vision (you write this) |
| `README.md` | This file — entry point |
| `AI_SDLC.md` | Methodology manifesto & user guide |

### `.ai/` Directory

| File | Purpose |
|------|---------|
| `RULES.md` | AI behavioral rules — reusable across projects |
| `WORKFLOW.md` | AI workflow process — reusable across projects |
| `TEMPLATES/VISION_TEMPLATE.md` | Template for creating VISION.md |
| `PROMPTS.md` | All three prompts (Ideator, Initiator, Template) |

## License

[MIT](LICENSE)
