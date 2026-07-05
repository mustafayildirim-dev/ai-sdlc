# AI Behavioral Rules

> **Meta-project notice:** This file is a DELIVERABLE of the AI-SDLC methodology project. It is NOT an instruction set for the AI building this methodology. In a user project, copy this file into `.ai/` and it will serve as behavioral rules for the AI assistant.
>
> Immutable directives for AI behavior. Do not modify without explicit human approval.
> Copy this file verbatim to every new AI-SDLC project.

---

## 1. Core Directives

| # | Rule |
|---|------|
| 1.1 | At the **start of every session**, read RULES.md, WORKFLOW.md, PROJECT.md, CONVENTIONS.md, TASKS.md, CHANGELOG.md, ARCHITECTURE.md, and DECISIONS.md before taking any action. If PROJECT.md does **not** exist, also read INITIATION.md. |
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

## 3. Documentation Discipline

| # | Rule |
|---|------|
| 3.1 | Update **CHANGELOG.md** for every meaningful change (feature, fix, refactor, docs, deprecation). Use the [Keep a Changelog](https://keepachangelog.com/) format. |
| 3.2 | Record every **architectural decision** in DECISIONS.md (ADR format) with: date, decision, context, options considered, rationale, consequences. |
| 3.3 | Update **CONVENTIONS.md** whenever a new pattern, naming convention, or stylistic choice is established. Include code examples. |
| 3.4 | Update **GLOSSARY.md** whenever a new domain term or acronym is introduced. |
| 3.5 | Keep **README.md** up to date with setup, usage, and contribution instructions. |
| 3.6 | **ARCHITECTURE.md** must reflect the current state of the system. If the implementation diverges from the documented architecture, update the document (or the code). |

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

## 6. Git & Version Control

| # | Rule |
|---|------|
| 6.1 | Follow the **branch strategy** defined in WORKFLOW.md. Never commit directly to `main` or `develop` unless it is a trivial hotfix. |
| 6.2 | Use **Conventional Commits** format: `<type>: <description>`. |
| 6.3 | Keep commits **small and focused** on a single concern. |
| 6.4 | Write commit messages that explain **what and why**, not how. |
| 6.5 | Never commit **secrets, API keys, passwords, or sensitive data**. If you detect such data, flag it immediately. |

## 7. Phase Triggers

*These rules map human commands to the appropriate workflow phase.*

| # | Rule |
|---|------|
| 7.1 | When **PROJECT.md does not exist** and the human mentions starting a project, propose running **Ideation** from INITIATION.md. |
| 7.2 | When the human says **"ideate"**, **"run the ideator"**, or **"interview me"**, execute **Step 0.2 (Ideation)** from INITIATION.md. |
| 7.3 | When the human says **"initiate"**, **"initialize"**, **"start the project"**, or **"scaffold"**, execute **Step 0.3 (Initiation)** from INITIATION.md. |
| 7.4 | When the human gives a **development task** ("implement X", "fix Y", "add feature Z"), execute **Phase 1 → Phase 4** from WORKFLOW.md. |
| 7.5 | When the human says **"review"** or **"retrospective"**, execute **Phase 4 (Review)** or **Phase 5 (Retrospective)** accordingly. |
| 7.6 | When the human says **"summarize"** or **"what's the status"**, provide a concise summary from TASKS.md and CHANGELOG.md without executing any phase. |

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
