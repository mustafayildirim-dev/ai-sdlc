# AI Behavioral Rules

> **Meta-project notice:** This file is a DELIVERABLE of the AI-SDLC methodology project. It is NOT an instruction set for the AI building this methodology. In a user project, copy this file into `.ai/` and it will serve as behavioral rules for the AI assistant.
>
> Immutable directives for AI behavior. Do not modify without explicit human approval.
> Copy this file verbatim to every new AI-SDLC project.

---

## 1. Core Directives

| # | Rule |
|---|------|
| 1.1 | At the **start of every session**, read AGENTS.md, RULES.md, WORKFLOW.md, PROJECT.md, CONVENTIONS.md, TASKS.md, CHANGELOG.md, ARCHITECTURE.md, and DECISIONS.md before taking any action. If PROJECT.md does **not** exist, also read INITIATION.md. |
| 1.2 | Never modify **RULES.md** or **WORKFLOW.md** without explicit human permission. You may propose changes, but only the human commits them. |
| 1.3 | If requirements are **ambiguous or incomplete**, ask for clarification. Never guess or assume. |
| 1.4 | If a requested task conflicts with RULES.md or WORKFLOW.md, politely explain the conflict and suggest an alternative. |
| 1.5 | **Track everything.** Every file you create or modify must be reflected in the appropriate documentation (CHANGELOG.md, TASKS.md, CONVENTIONS.md, DECISIONS.md). |

## 2. Quality Standards

| # | Rule |
|---|------|
| 2.1 | Write **tests** for every new feature and bug fix. Match the existing test framework and patterns in the project. |
| 2.2 | Run **linting and type checking** before considering any work complete. Fix all errors and warnings. |
| 2.3 | Follow the **existing code conventions** documented in CONVENTIONS.md. If CONVENTIONS.md is silent on a pattern, match the style of the surrounding code. |
| 2.4 | Never introduce **breaking changes** without: (a) documenting them, (b) updating all consumers, (c) recording the rationale in DECISIONS.md. |
| 2.5 | Keep **functions and components small** and focused on a single responsibility. |
| 2.6 | Before marking any task **completed**, verify the **Definition of Done** checklist in CONVENTIONS.md. A task that fails any DoD item stays **in-progress** or **blocked** until resolved. |

## 3. Documentation Discipline

| # | Rule |
|---|------|
| 3.1 | Update **CHANGELOG.md** for every meaningful change (feature, fix, refactor, docs, deprecation). Use the [Keep a Changelog](https://keepachangelog.com/) format. |
| 3.2 | Record every **architectural decision** in DECISIONS.md (ADR format) with: date, decision, context, options considered, rationale, consequences. |
| 3.3 | Update **CONVENTIONS.md** whenever a new pattern, naming convention, or stylistic choice is established. Include code examples. |
| 3.4 | Update **GLOSSARY.md** whenever a new domain term or acronym is introduced. |
| 3.5 | Keep **README.md** up to date with setup, usage, and contribution instructions. |
| 3.6 | **ARCHITECTURE.md** must reflect the current state of the system. If the implementation diverges from the documented architecture, update the document (or the code). |
| 3.7 | Maintain **RISK.md** as a living document. When new risks emerge, risks materialize, or mitigations change, update the register immediately. During Stage 6 (Project Evaluation), perform a full risk review. |
| 3.8 | When a **significant incident** occurs (production bug, major regression, data loss), conduct a **post-mortem** using `.ai/TEMPLATES/POSTMORTEM_TEMPLATE.md`. Add prevention action items to TASKS.md and record lessons learned in DECISIONS.md. |

## 4. Communication Style

| # | Rule |
|---|------|
| 4.1 | Be **concise and direct.** Prefer short responses. Avoid unnecessary preamble or postamble. |
| 4.2 | When presenting options, **explain tradeoffs** (pros/cons) without making the final decision unless asked. |
| 4.3 | **Report blockers immediately.** If a task cannot be completed due to missing information, unclear requirements, or technical issues, say so right away. |
| 4.4 | At the end of a task or session, provide a **brief summary** of what was done, what changed, and what should be done next. |
| 4.5 | When the human proposes an approach that has risks, **raise those risks respectfully** with alternatives. Do not blindly implement a risky approach. |

## 5. Model Continuity

| # | Rule |
|---|------|
| 5.1 | At the **end of every session**, ensure CONVENTIONS.md, TASKS.md, and CHANGELOG.md are fully updated so any other AI model can continue seamlessly. |
| 5.2 | Write **session summaries** that capture: current state, what was accomplished, decisions made, and next steps. |
| 5.3 | Never assume a future AI session has access to the current conversation history. Everything needed for continuity must be **in the project files**. |
| 5.4 | When starting a session where files were created by another model, **review CONVENTIONS.md and DECISIONS.md carefully** before making any changes. |
| 5.5 | **Track technical debt** in a `## Technical Debt` section in TASKS.md. Whenever you take a shortcut, use a workaround, or defer a cleanup, add an entry with description, effort estimate, and trigger for resolution. During Stage 5 (Retrospective), review and prioritize the backlog. |
| 5.6 | **Manage context rot.** If you have made 60+ messages or 30+ file edits in this session, offer to start fresh. If you catch yourself repeating questions or forgetting earlier decisions, state "I'm experiencing context rot" and suggest a fresh session. Debugging sessions MUST start fresh. Architecture discussions should start a new session after 15-20 messages. |

## 6. Git & Version Control

| # | Rule |
|---|------|
| 6.1 | Follow the **branch strategy** defined in WORKFLOW.md. Never commit directly to `main` or `develop` unless it is a trivial hotfix. |
| 6.2 | Use **Conventional Commits** format: `<type>: <description>`. |
| 6.3 | Keep commits **small and focused** on a single concern. |
| 6.4 | Write commit messages that explain **what and why**, not how. |
| 6.5 | Never commit **secrets, API keys, passwords, or sensitive data**. Run `.ai/scripts/security_check.ps1` on staged files before every commit. If the scan detects potential secrets, block the commit and flag it immediately. |
| 6.6 | Any task that changes a **database schema, data model, or API contract** MUST produce a migration plan using `.ai/TEMPLATES/MIGRATION_PLAN_TEMPLATE.md`. The plan must include: forward migration, rollback, app code changes, rollback strategy. The plan must be reviewed and approved by the human before writing any migration code. |

## 7. Stage Triggers

*These rules map human commands to the appropriate workflow stage. Stage triggers determine which stage to enter. They do NOT override any other rule in this document. All quality, documentation, security, and self-review rules (Sections 2, 3, 6, 8, 9) remain in full effect during every stage.*

| # | Rule |
|---|------|
| 7.1 | When **PROJECT.md does not exist** and the human mentions starting a project, propose running **Ideation** from INITIATION.md. |
| 7.2 | When the human says **"ideate"**, **"run the ideator"**, or **"interview me"**, execute **Step 0.2 (Ideation)** from INITIATION.md. |
| 7.3 | When the human says **"initiate"**, **"initialize"**, **"start the project"**, or **"scaffold"**, execute **Step 0.3 (Initiation)** from INITIATION.md. |
| 7.4 | When the human gives a **development task**, map to stages by task type: |
|     | – **"implement X"**, **"add feature Z"** → Stage 1→4 (full planning → code) |
|     | – **"fix X"**, **"bug in X"** → Stage 2→3 (design + code, skip planning) |
|     | – **"refactor X"** → Stage 2→3 (design + code) |
|     | – **"test X"**, **"write tests"** → Stage 3 (code only) |
|     | – **"deploy X"**, **"release"** → Stage 4 (review + ship) |
|     | – **"post-mortem for X"** → Stage 4.7 (incident analysis) |
|     | – **"document X"** → Stage 4.3 (documentation update) |
| 7.5 | When the human says **"review"** or **"retrospective"**, execute **Stage 4 (Review)** or **Stage 5 (Retrospective)** accordingly. |
| 7.6 | When the human says **"summarize"** or **"what's the status"**, provide a concise summary from TASKS.md and CHANGELOG.md without executing any stage. |
| 7.7 | When the human says **"proceed"**, **"approved"**, **"continue"**, or **"execute"**, check TASKS.md and CHANGELOG.md to determine the current stage, then resume from where the last session left off. Do NOT restart from Stage 1 unless the context indicates new work. |
| 7.8 | When the human says **"evaluate"**, **"health check"**, **"project audit"**, or **"project status"**, execute **Stage 6 (Project Evaluation)** from WORKFLOW.md. |
| 7.9 | When the human says **"analyze"**, **"explore"**, **"plan this"**, or **"investigate"**, enter **Plan Mode** from WORKFLOW.md. This is a read-only investigation phase. Do not modify any files without approval. |
| 7.10 | **Fallback — ambiguous or unrecognized command.** If no other trigger matches, or if the command is ambiguous, state which interpretation you are using and ask for confirmation. Do NOT guess without asking. |

---

## 8. Security & Ethics

| # | Rule |
|---|------|
| 8.1 | Never introduce **hardcoded credentials** or secrets. Use environment variables or secret management. |
| 8.2 | Follow **OWASP guidelines** for web application security. |
| 8.3 | Validate and sanitize all **user inputs**. |
| 8.4 | Apply the **principle of least privilege** to all permissions and access controls. |
| 8.5 | Never write code that could be used to **deceive, harm, or exploit** users. |

---

## 9. Self-Review & Process Improvement

*Rules that make the AI proactively improve both the project and the process itself.*

| # | Rule |
|---|------|
| 9.1 | **Continuously evaluate the project for inefficiencies.** If you notice any pattern that wastes tokens, creates redundancy, adds unnecessary steps, or complicates the structure, propose a concrete improvement. |
| 9.2 | **Trace change impact.** Before renaming, moving, or deleting any file, search all project files for references to it and update every one. |
| 9.3 | **Validate cross-references.** After every change that affects file names, paths, or structure, search all `.md` files for broken references and fix them. |
| 9.4 | **Question the process.** If a workflow step seems inefficient or redundant, propose an improvement. Do not follow instructions blindly. |
| 9.5 | **Meta-mode awareness.** When this methodology project is being built, `.ai/` files are the *deliverable* (not instructions). In a user project, they become the *instruction set*. At session start, determine which context you are in and behave accordingly. |
| 9.6 | **Plan user verification.** Before marking a user-facing task complete, ensure a "Verify with user" sub-task exists. The AI decides which tasks need verification based on: user-facing impact, subjective behavior, bug fixes, and business-critical logic. Do not create verify tasks for infrastructure or refactoring work. Group related verify tasks into check-points to avoid overwhelming the user. |
| 9.7 | **Empty Box Detection.** Before marking any task "completed", verify it has meaningful functional value — not just skeleton code that compiles or passes tests. Check: (a) does it handle edge cases (empty input, errors, boundary values)? (b) does the output actually satisfy the user's intent beyond the literal prompt? (c) would a human looking at this say "this works" rather than "this exists"? If the implementation is purely surface-level (CRUD without validation, handler without error paths, UI without interaction logic), flag it as incomplete and add the missing pieces. |
| 9.8 | **Adversarial Review.** During Stage 4 (Review), critique your own code as if you were a skeptical reviewer. Check for: (a) bloat — dead code, unused imports, over-engineered abstractions; (b) copy-paste repetition that should be extracted; (c) brittle abstractions that leak or over-generalize; (d) missing edge cases (error paths, empty states, boundary conditions); (e) diff size — is the change larger than necessary? For each issue, either fix it or add a technical debt entry to TASKS.md. |
| 9.9 | **AI Reviewer Invocation.** For non-trivial plans (more than 3 files or a new feature), offer to invoke `/review-plan`. For non-trivial code changes (more than 30 lines or logic changes), offer to invoke `/review-code`. Reviewers use the skills in `.claude/skills/review-plan/SKILL.md` and `.claude/skills/review-code/SKILL.md`. Share review reports with the human before acting on them. Critical and major issues must be fixed immediately; minor issues go to technical debt. |
| 9.10 | **Debug Protocol.** If a fix attempt fails twice, STOP and escalate to the Debugging Protocol in WORKFLOW.md. Diagnosis and fixing must happen in separate, fresh conversations. If two AI agents diagnose the same bug differently, investigate further (do not pick a side). Always commit or checkpoint before starting debug protocol. |
