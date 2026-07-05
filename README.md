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
2. Place the prompt files from `~/.ai-sdlc/prompts/` somewhere accessible

### Starting a New Project

```
1. Write VISION.md       → 5 minutes (use the template in .ai/TEMPLATES/)
2. Run the Ideator       → AI interviews you to create PROJECT.md
3. Run the Initiator     → AI creates architecture, plan, and scaffolds code
4. Use the Template      → AI executes tasks iteratively
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

### Prompt Files (at `~/.ai-sdlc/prompts/`)

| File | When to Use |
|------|-------------|
| `project_ideator_prompt.md` | When you have VISION.md but no PROJECT.md yet |
| `project_initiator_prompt.md` | When PROJECT.md is ready, to initialize the project |
| `prompt_template.md` | For daily ongoing development |

## License

[MIT](LICENSE)
