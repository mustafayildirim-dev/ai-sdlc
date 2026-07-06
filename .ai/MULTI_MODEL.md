# Multi-Model Strategy

> Guidance on using different AI models for different tasks to optimize cost, speed, and quality.

## Principle

Not every task needs a frontier model. By matching model capability to task complexity, you get better results at lower cost.

## Model Tier Assignment

| Tier | Models | Best For | Cost |
|------|--------|----------|------|
| **Frontier** | Claude Opus 4+, GPT-5+, Gemini Ultra | Architecture design, security reviews, schema design, complex debugging, strategic decisions | High |
| **Standard** | Claude Sonnet 4+, GPT-5, Gemini Pro, DeepSeek V4 | Feature implementation, refactoring, test writing, documentation, code review | Medium |
| **Light** | Claude Haiku, GPT-4o-mini, local models (Ollama) | Boilerplate generation, formatting, simple edits, summarization, classification | Low |

## Workflow by Tier

### Frontier — When to Use

- **Architecture decisions** — designing new components, data models, API contracts
- **Security-sensitive code** — authentication, authorization, encryption, secrets handling
- **Critical bug diagnosis** — production outages, data corruption, concurrency bugs
- **Strategic planning** — milestone definition, risk assessment, technology selection

### Standard — Default Tier

- **Feature implementation** — most day-to-day development
- **Test writing** — unit tests, integration tests, test infrastructure
- **Code review** — reviewing diffs, identifying issues
- **Refactoring** — restructuring existing code
- **Documentation** — updating README.md, CHANGELOG.md, API docs

### Light — When to Optimize for Speed

- **Simple edits** — variable renames, type fixes, formatting
- **Boilerplate generation** — CRUD endpoints, serializers, DTOs
- **Summarization** — session summaries, changelog entries
- **Classification** — sorting issues, categorizing tasks
- **Exploration** — grepping codebases, reading logs, initial investigation

## Practical Setup

### OpenCode / Claude Code

Use `~/.claude/CLAUDE.md` to set default model:

```
# in ~/.claude/CLAUDE.md
model: claude-sonnet-4-20250514
```

Switch per task with the model flag:

```bash
# Heavy architecture task
claude --model claude-opus-4-20250514

# Quick boilerplate
claude --model claude-haiku-4-20250514
```

### Cursor

Switch models in the Composer dropdown. Save frontier models for:
- Agent mode asking "plan" before "code"
- Complex multi-file refactors
- Security-critical code generation

## Guardrails

- **Never** use a light model for security-critical code or architectural decisions
- **Always** review frontier-model output for bloat and over-abstraction (see Adversarial Review)
- **Always** run verification loop (tests + lint + type check) regardless of which model generated the code
