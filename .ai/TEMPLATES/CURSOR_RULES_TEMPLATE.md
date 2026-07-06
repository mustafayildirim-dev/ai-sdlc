# Cursor Rules — Project Behavior

> Place this file in `.cursor/rules/` (modern) or as `.cursorrules` (legacy) in the project root.
> Cursor loads these rules automatically at session start.

@AGENTS.md

## Cursor-Specific Rules

- **Agent mode**: use Composer (Cmd+K / Ctrl+K) for multi-file changes. Use Chat (Cmd+L / Ctrl+L) for questions.
- **Review diffs**: read every diff that touches auth, data, or security. For UI and utility code, a functional review is sufficient.
- **Inline context**: attach relevant files to your prompt — Cursor indexes the codebase but explicit context improves accuracy.
- **Run before accepting**: after generation, run the build/test/lint commands. Only accept changes when all checks pass.

## Project Commands

<!-- Update per project -->

- **Install:** `[npm install, pip install -r requirements.txt, ...]`
- **Test:** `[npm test, pytest, ...]`
- **Lint:** `[npm run lint, ruff check ., ...]`
- **Type check:** `[tsc --noEmit, mypy ., ...]`
- **Dev server:** `[npm run dev, uvicorn main:app --reload, ...]`

## Code Style

<!-- Update per project conventions -->

- Preferred patterns, imports order, naming conventions
- File and folder naming conventions
- Component structure for UI projects
