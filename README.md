# AI-SDLC

**AI-Assisted Software Development Lifecycle** — A structured methodology for building production-grade software with AI assistance.

## What is AI-SDLC?

AI-SDLC is a complete SDLC adapted for human-AI collaboration. It solves three core problems:

1. **Lost context** — AI conversations are ephemeral; project knowledge disappears when the session ends
2. **Inconsistent quality** — Without structure, AI skips testing, documentation, and design
3. **Model lock-in** — Switching AI models resets everything; conventions don't transfer

## Quick Start

### Prerequisites

- An AI assistant (Claude, GPT, OpenCode, etc.)
- Git
- A text editor

### Setup (One-Time)

Copy the entire `.ai/` directory (containing RULES.md, WORKFLOW.md, INITIATION.md, and TEMPLATES/) into your new project.

### Starting a New Project

```
1. Write VISION.md               → 5 minutes
2. Tell AI: "Run the ideator"    → AI interviews you, creates PROJECT.md
3. Tell AI: "Initialize project" → AI scaffolds code, creates plans
4. Tell AI: "Implement X"        → AI follows workflow stages
```

No copy-paste needed. The AI reads RULES.md and WORKFLOW.md directly.

For full instructions, read **[AI_SDLC.md](./AI_SDLC.md)**.

## Techniques & Principles

### 🔄 Workflow (İş Akışı)

| Technique | Purpose |
|-----------|---------|
| **Stage Gate Model** | 6 stage'in entry/exit kriterleriyle kalite kontrolü |
| **Stage Triggers** | İnsan komutunu stage'e eşleyen 9 kural (RULES.md §7.1-7.9) |
| **Session Lifecycle** | Oturum açılış sırası, trigger mapping, kapanış protokolü |
| **Plan Mode** | Her iş öncesi salt-okunur keşif aşaması — anlamadan dokunma |
| **Reverse Brief** | AI'nın görev anlayışını insana teyit ettirmesi |
| **Acceptance Criteria (Given/When/Then)** | Her task için test edilebilir kabul kriterleri |
| **Definition of Done** | 9 maddelik tamamlanma kontrol listesi |

### ✅ Quality (Kalite)

| Technique | Purpose |
|-----------|---------|
| **Verification Loop** | Change → Verify → Fix → Repeat kapalı döngüsü |
| **Adversarial Review** | AI'nın kendi kodunu şişkinlik/kopya/abstraction/edge-case açısından eleştirmesi |
| **Empty Box Detection** | Satisficing önleme — yüzeyel implementasyonları yakalama |
| **Self-Review Checklist** | 6 kriter (correctness, completeness, consistency, security, performance, 3-layer) |
| **Three-Layer Consistency** | Data / Controller / View katmanlarının senkronizasyonu |
| **AI Plan Reviewer** | İkinci AI'ın planı incelemesi (gaps, inconsistency, over-engineering) |
| **AI Code Reviewer** | İkinci AI'ın kodu incelemesi (bugs, error handling, test coverage, security) |
| **User Verification Gate** | Kullanıcıya senaryo sunup geribildirim bekleme |
| **Functional Walkthrough** | AI'nın her kabul kriterini kanıtla göstermesi |

### 🔧 Debugging & Maintenance (Hata Ayıklama & Bakım)

| Technique | Purpose |
|-----------|---------|
| **Debugging Protocol** | Teşhis ve çözümü ayıran yapılandırılmış protokol (D.1-D.4) |
| **Context Rot Management** | Uzun oturumlarda kalite düşüşünü önleme |
| **Technical Debt Tracking** | TASKS.md'de ayrılmış backlog, her retrospective'de gözden geçirme |
| **Post-Mortem Process** | Olay sonrası yapılandırılmış analiz (template ile) |
| **Migration Plan Requirement** | Schema değişikliklerinde forward/rollback plan zorunluluğu |

### 📚 Continuity & Documentation (Süreklilik & Dokümantasyon)

| Technique | Purpose |
|-----------|---------|
| **Model Continuity System** | CONVENTIONS.md + TASKS.md + CHANGELOG.md ile model değişimlerinde kesintisiz geçiş |
| **Session Summary Protocol** | Her oturum sonu zorunlu özet |
| **ADR (Architecture Decision Records)** | Kararların yapılandırılmış dokümantasyonu |
| **Change Impact Tracing** | Dosya taşıma/silme öncesi referans taraması |
| **Cross-Reference Verification** | Tüm .md referanslarının otomatik doğrulaması |
| **Example File Reference Pattern** | `file_path:line` formatı standardı |
| **Prompt Structure** | Goal + Constraints + Verification + Process formatı |

### 🔒 Security & Governance (Güvenlik & Yönetişim)

| Technique | Purpose |
|-----------|---------|
| **Security Scan Gate** | Pre-commit zorunlu secret taraması |
| **Git Branch Strategy** | feature/fix/docs/chore/explore branch modeli |
| **Conventional Commits** | feat/fix/docs/style/refactor/test/chore formatı |
| **Checkpoint Git Workflow** | `explore/` branch'inde checkpoint commit → squash → merge |
| **Multi-Model Strategy** | Frontier/Standard/Light tier assignment |

### 🧠 Meta-Process (Süreç İyileştirme)

| Technique | Purpose |
|-----------|---------|
| **Meta-Mode Awareness** | AI'nın metodolojiyi inşa mı yoksa kullan mı ettiğini bilmesi |
| **Question the Process** | AI'nın verimsiz adımları sorgulama yetkisi |

## System Files

### Project Root

| File | Purpose |
|------|---------|
| `VISION.md` | Product vision (you write this) |
| `README.md` | This file — entry point |
| `AI_SDLC.md` | Methodology manifesto & user guide |
| `CONTRIBUTING.md` | Contribution guidelines |
| `LICENSE` | MIT license |
| `AGENTS.md` | AI onboarding — read first in every session |
| `RISK.md` | Risk register — active, mitigated, closed risks |
| `MULTI_MODEL.md` | Multi-model strategy — which model for which task |

### `.ai/` Directory

| File | Purpose |
|------|---------|
| `RULES.md` | AI behavioral rules — reusable across projects |
| `WORKFLOW.md` | AI workflow process — reusable across projects (read every session) |
| `INITIATION.md` | Stage 0: Ideation & Initiation — only read during project setup |
| `CONVENTIONS.md` | Project conventions & terminology |
| `TEMPLATES/` | Starter templates: VISION.md, ADR, CONVENTIONS, GLOSSARY, CLAUDE.md, Cursor rules, MCP config, post-mortem, opencode.json, prompt structure, plan/code reviewer skills, migration plan |
| `scripts/security_check.ps1` | Pre-commit secret scanner |
| `scripts/validate_refs.ps1` | Cross-reference link checker |
| `TEMPLATES/POSTMORTEM_TEMPLATE.md` | Post-incident analysis template |
| `TEMPLATES/CLAUDE_TEMPLATE.md` | Claude Code config (references AGENTS.md) |
| `TEMPLATES/CURSOR_RULES_TEMPLATE.md` | Cursor IDE rules |
| `TEMPLATES/MCP_CONFIG_TEMPLATE.json` | MCP server configuration |

## License

[MIT](LICENSE)
