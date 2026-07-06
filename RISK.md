# Risk Register

> Tracked and updated throughout the project lifecycle.

## Risk Format

| ID | Risk | Probability | Impact | Mitigation | Status |
|----|------|-----------|--------|------------|--------|
| R-001 | ... | Low/Med/High | Low/Med/High | ... | Active/Mitigated/Closed |

## Active Risks

| ID | Risk | Probability | Impact | Mitigation |
|----|------|-----------|--------|------------|
| R-001 | Methodology adoption — users find the system too heavy and revert to ad-hoc prompting | Medium | High | Keep quick-start under 30 min; emphasize incremental adoption (start with just RULES.md + WORKFLOW.md) |
| R-002 | Documentation rot — AI_SDLC.md and README.md fall behind RULES.md/WORKFLOW.md changes | High | Medium | Run Stage 6 (Project Evaluation) before every release; cross-ref validation in CI |
| R-003 | AI model incompatibility — future AI models don't follow markdown instructions as expected | Low | High | Design for model-agnosticism; CONVENTIONS.md as the bridge; test with 3+ model families |
| R-004 | Community stagnation — no contributors, no issues, no adoption | Medium | Medium | Active GitHub presence; clear CONTRIBUTING.md; low barrier for first-time contributors |

## Mitigated Risks

| ID | Risk | Mitigation Outcome |
|----|------|-------------------|
|     |      |                   |

## Closed Risks

| ID | Risk | Reason Closed |
|----|------|---------------|
|     |      |               |
