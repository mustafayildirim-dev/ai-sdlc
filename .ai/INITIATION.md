# Project Initiation Guide

> Stage 0 of the AI-SDLC workflow. Read this file only when PROJECT.md does not exist (starting a new project).
> Once the project is initialized, this file is no longer needed.

---

## Entry Criteria

- [ ] VISION.md exists and is filled in by the human
- [ ] RULES.md and WORKFLOW.md are accessible
- [ ] No other project files exist yet

---

## Step 0.1: Load Context

```
├── Read VISION.md
├── Read RULES.md
├── Read WORKFLOW.md
└── Read INITIATION.md
```

---

## Step 0.2: Ideation (if PROJECT.md does not exist)

### Interview Style

- Ask **one question at a time** — never overwhelm with multiple questions
- **Propose defaults** when the human is unsure:
  > "For the tech stack, I suggest React + Node.js + PostgreSQL because..."
- **Explain tradeoffs** when proposing options (pros/cons)
- Confirm each major section before moving to the next
- Summarize what you have learned every 3-4 questions

### Required Information

| Section | Questions to Explore |
|---------|---------------------|
| **Product Overview** | What is this product? What does it do? |
| **Target Audience** | Who are the users? What are their needs? |
| **Core Features (MVP)** | What is the minimum set to launch? |
| **Future Features** | What comes after MVP? |
| **Technical Stack** | Languages, frameworks, databases, hosting, third-party services. If unsure, propose options with tradeoffs. |
| **Milestones & Timeline** | Major milestones with estimated durations. |
| **Success Criteria & KPIs** | How do we know we are done? |
| **Known Risks & Mitigations** | What could go wrong? Backup plans? These will be transferred to RISK.md during initiation. |

### Guardrails

- Do **NOT** write any code or create any project files yet
- This is a **discovery stage only** — no implementation
- If the human gives vague answers, **push for specifics** with examples
- If the human mentions unfamiliar technical details, **ask clarifying questions**

### Output

- Iteratively build PROJECT.md as the human answers
- Present the complete PROJECT.md for human approval before saving

---

## Step 0.3: Project Initiation

### Analyze

- Read and fully understand the approved PROJECT.md
- Identify the core domain and key entities
- Determine system boundaries and external dependencies
- Evaluate technical stack choices

### Design Architecture

Write `ARCHITECTURE.md` with:
- System context and high-level structure
- Component diagram (described in text)
- Data models and relationships
- API design (endpoints, contracts)
- Data flow descriptions
- Key design patterns to use
- Deployment model

Record every architecture decision in `DECISIONS.md` (ADR format):
date, context, options considered, rationale, consequences.

### Plan

Create **TASKS.md** with WBS (Work Breakdown Structure):
```
milestone → feature → task
```
Each task should be small enough to complete in one session.

Create **ROADMAP.md** with milestones, targets, and duration estimates.
Identify dependencies between milestones.

### Create Supporting Files

| File | Purpose |
|------|---------|
| `CONVENTIONS.md` | Initial coding standards, naming, patterns |
| `GLOSSARY.md` | Domain terms and definitions |
| `CHANGELOG.md` | First entry: "Initialized project" |
| `README.md` | Setup instructions, prerequisites, quick start |
| `.gitignore` | Standard ignores for the tech stack |
| `RISK.md` | Transfer risks from PROJECT.md into structured format |

### Scaffold

- Create the directory structure
- Initialize package managers and config files
- Set up linters and formatters
- Set up test framework
- Scaffold `opencode.json` with custom instructions (if project uses OpenCode)
- Create the first source file(s) as a verification
- Verify everything builds/runs

### Guidelines

- Do **NOT** over-scaffold — create only what the first milestone needs
- **Keep it runnable** — after scaffolding, the project should build/run
- **Be conservative** — favor well-known, stable technologies
- **Make decisions explicit** — every choice goes into DECISIONS.md

### Report

Present a summary to the human:

- What was created (all files and directories)
- Architecture overview (3-5 sentences)
- Milestone plan (key milestones with dates)
- Next immediate step
- Any decisions needing human input
- Choose a license before publishing. Ask:
  "Which license would you like to use?
  - **MIT** (Recommended for most projects) — Permissive, widely adopted, allows commercial use with attribution. Best for libraries, tools, and methodology projects.
  - **Apache 2.0** — Permissive with patent protection. Best for corporate projects or projects with patent concerns.
  - **GPL-3.0** — Copyleft, derivatives must stay open source. Best if you want to ensure all modifications remain free.
  - **None** — No license, all rights reserved."
  - Copy the selected license template from `.ai/TEMPLATES/LICENSE_{MIT,APACHE,GPL}.md` to `LICENSE`, replacing `{{year}}` and `{{project_name}}`
  - `git add LICENSE` + `git commit -m "docs: add LICENSE"`
- Ask: "Would you like to publish this project to GitHub?"
  - If **yes**: guide the human to create a repo on github.com, then:
    ```
    git remote add origin <url>
    git push -u origin main
    ```
    Ask: "Would you like to enable GitHub Pages for README visibility?"
  - If **no**: skip, the human can do it later

---

## Exit Criteria

- [ ] PROJECT.md approved by human
- [ ] All project files created
- [ ] System architecture documented
- [ ] Git repository initialized
- [ ] First milestone tasks are in TASKS.md
