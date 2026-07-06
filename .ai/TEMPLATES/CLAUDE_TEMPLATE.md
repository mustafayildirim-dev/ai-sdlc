# CLAUDE.md — Instructions for Claude Code

> Claude Code loads this file at session start. It references the shared AGENTS.md for cross-tool compatibility.
> To use: place this file at the project root as `CLAUDE.md`. Ensure `AGENTS.md` also exists in the project root.

@AGENTS.md

## Claude-Specific Rules

- **Plan mode before edits**: start every non-trivial task in plan mode (`--permission-mode plan` or Shift+Tab). Investigate, propose an approach, then wait for approval before touching any file.
- **Verification loop**: after every change, run the test/lint/type-check command. Read the output. If it fails, fix before proceeding.
- **Minimal diffs**: touch only files required by the task. If you find yourself modifying files outside the scope, stop and ask.
- **Commit discipline**: commit at every working state. Use `checkpoint:` prefix for intermediate saves, squash before merging.

## Project Structure

<!-- Update this section per project -->

- **Language/Framework:** [e.g. Python 3.12 / FastAPI]
- **Package manager:** [e.g. uv, npm, cargo]
- **Test command:** `[e.g. pytest, npm test, cargo test]`
- **Lint command:** `[e.g. ruff check ., npm run lint]`
- **Type check:** `[e.g. mypy ., tsc --noEmit]`
- **Build/run:** `[e.g. uvicorn main:app --reload, npm run dev]`

## Skills (Optional)

You can create AI review skills in `.claude/skills/`:

- `.claude/skills/review-plan/SKILL.md` — plan reviewer skill
- `.claude/skills/review-code/SKILL.md` — code reviewer skill

Invoke with `/review-plan` or `/review-code` after setup. These invoke a second AI instance to review plans and code independently.

## Never Touch

<!-- List files or directories the AI must never modify -->

- `CLAUDE.md`
- `AGENTS.md`
- `.github/workflows/`
- (add project-specific protected files)
