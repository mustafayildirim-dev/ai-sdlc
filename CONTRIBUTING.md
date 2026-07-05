# Contributing

## How to Contribute

1. **Fork** the repository
2. **Create a branch**: `docs/<description>`, `feat/<description>`, `fix/<description>`
3. **Make your changes**
4. **Run validation**: `powershell .ai/scripts/validate_refs.ps1`
5. **Commit** using Conventional Commits: `<type>: <description>`
6. **Push** and open a Pull Request

## What We Accept

| Type | Examples |
|------|----------|
| `docs` | Clarifications, translations, template improvements |
| `feat` | New workflow steps, new templates, new rules |
| `fix` | Broken references, typos, logic errors in workflow |
| `chore` | CI, tooling, repo maintenance |

## Guidelines

- Keep changes focused on one concern per commit
- Update cross-references if you rename or move files
- If you modify a template, update AI_SDLC.md accordingly
- For significant changes, open an issue first to discuss
