# AI Skills Directory

> Skills are reusable AI capabilities invoked by command (e.g., `/review-plan`, `/review-code`). They delegate specific tasks to separate AI instances for independent review.

## Available Skills

| Skill | Command | Purpose | Location |
|-------|---------|---------|----------|
| Plan Reviewer | `/review-plan` | Reviews implementation plans for gaps, inconsistency, over-engineering | `.claude/skills/review-plan/SKILL.md` |
| Code Reviewer | `/review-code` | Reviews generated code for bugs, error handling, test coverage, security | `.claude/skills/review-code/SKILL.md` |

## How to Use

1. Ensure the `.claude/skills/` directory exists in your project root
2. Copy the skill `.md` files from `.ai/TEMPLATES/REVIEWER_SKILL_TEMPLATE.md` (extract each skill block)
3. Invoke during a session: `/review-plan` or `/review-code`
4. The skill runs in its own AI context (no context rot from the main session)

## Creating New Skills

1. Create a new directory under `.claude/skills/<skill-name>/`
2. Create `SKILL.md` with frontmatter (`name`, `description`) and instructions
3. Document the skill in this file
4. Reference the skill in CLAUDE.md if using Claude Code
