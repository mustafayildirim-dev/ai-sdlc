# Coding Conventions

> AI-managed file. Updated whenever a new pattern or decision is established.

## Language & Frameworks

- **Language:** [e.g. Python 3.12]
- **Framework:** [e.g. FastAPI]
- **Testing:** [e.g. pytest 8.x]

## Naming Conventions

| Element | Convention | Example |
|---------|-----------|---------|
| Files | `snake_case` | `user_service.py` |
| Classes | `PascalCase` | `UserService` |
| Functions | `snake_case` | `get_user_by_id` |
| Variables | `snake_case` | `user_list` |
| Constants | `UPPER_SNAKE` | `MAX_RETRY_COUNT` |
| Routes | `kebab-case` | `/api/user-profiles` |

## Code Style

- Type hints required on all public functions
- Docstrings: Google style
- Line length: 88 characters
- Imports: stdlib → third-party → local (alphabetical within groups)

## Testing

- Test file: `tests/test_<module>.py`
- Test class: `Test<Name>`
- Test function: `test_<scenario>_<expected>`
- Prefer parametrized tests over multiple test functions

## Directory Structure

```
src/
  <domain>/
    __init__.py
    models.py
    service.py
    routes.py
tests/
```
