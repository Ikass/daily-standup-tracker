# AGENTS.md — StandupApp

## Project Context

**StandupApp** is a *learning project*, not a live product. It follows [*Build a SaaS App in Rails*](https://buildasaasappinrails.com/) chapter by chapter. The goal is production-grade Rails depth for junior/mid interviewing, not shipping to customers.

This project sits inside the **Tech-Job / Job-Ready Plan** — a 12-week track documented in the productivity system. Any architectural suggestion should consider the learning goal: "does this teach production patterns?" not "is this the fastest shortcut?"

---

## Stack & Conventions

| Layer | Choice | Why |
|---|---|---|
| Framework | Rails 8.1.1 | Book-driven |
| Ruby | 3.4.8 | `.ruby-version` |
| Database | PostgreSQL | Book default; real-world familiarity over SQLite3 |
| CSS | **Bulma** | Personal convention. **Tailwind is not used here.** |
| JS | Hotwire (Turbo + Stimulus) | Book uses it; no React/Vue/jQuery |
| Assets | Propshaft + Importmap | Rails 8 default |
| Background jobs | Solid Queue | Rails-native, no Redis |
| Cache | Solid Cache | Postgres-backed |
| Cable | Solid Cable | Postgres-backed |
| Testing | RSpec + FactoryBot + Capybara | Replaced Minitest at project setup |
| Auth | `has_secure_password` + Rolify + Pundit | Book pattern, already in Gemfile |
| Deployment | Kamal 2 + Hetzner (EU) | Personal convention; no Heroku/Vercel |

### Coding Style

- Follow Rails conventions ("the Rails way") unless the book teaches an alternative
- Explain the *why* behind any architectural recommendation
- RSpec for all tests: model specs, request specs, system specs
- Service objects when the book introduces them (Ch.6)
- No custom build pipelines; Propshaft + Importmap are sufficient

---

## What Not to Suggest

- **No React, Vue, or any JS framework** — Hotwire only
- **No Tailwind CSS** — Bulma is the chosen framework
- **No Heroku or Vercel** — Kamal 2 + Hetzner
- **No SQLite3** — PostgreSQL is intentional for this project
- Do not add unnecessary complexity (extra gems, abstractions) unless the book introduces them or there is a strong learning reason

---

## Productivity System Links

The canonical sprint plans and weekly priorities live in the Obsidian vault. Update the `updated:` frontmatter date if you edit these files.

| File | Purpose |
|---|---|
| `01.Projects/Rails/build-saas-app-rails/_milestones.md` | Chapter-by-chapter milestones and learning log |
| `01.Projects/Rails/build-saas-app-rails/_priorities.md` | Weekly sprint plan (current week) |
| `01.Projects/Tech-Job/job-ready-plan.md` | 12-week track overview, capacity splits, checkpoints |
| `01.Projects/Tech-Job/_priorities.md` | Weekly Tech-Job priorities (cross-project) |

---

## Reflection Prompt (Post-Session)

**After each significant coding session, prompt the user to reflect.**

The `job-ready-plan.md` includes a "Notes log" section for weekly reflections. After finishing a chunk of work (e.g., a chapter exercise, a feature, or a bug fix), ask the user:

> "What clicked today? What's still fuzzy? Any patterns you want to flag for later review?"

If the user wants to log it, offer to append the reflection to the notes log in `01.Projects/Tech-Job/job-ready-plan.md` under the "Notes log" heading, prefixed with the date.

Example format:
```markdown
- 2026-07-02: Multi-tenancy via `current_account` clicked. Still fuzzy on Pundit scoping with Rolify roles.
```

Also flag if the week's sprint plan in `build-saas-app-rails/_priorities.md` needs updating (e.g., a task took longer than the 30-min sprint estimate).

---

## Current Status (as of last edit)

- Ch.1 project skeleton: controllers (`Activity`, `Support`, `Static`), views, layout
- Ch.2 authentication: complete (`User`, `Session`, `Account`, `Current` models; sessions, registrations, passwords controllers/views)
- Bulma migration: complete (Tailwind removed from Gemfile)
- Models: `User`, `Session`, `Account` with migrations and factories
- Testing: model specs, request specs, system specs for sign-up and sign-in
- Next: Ch.3 — teams & invitations
