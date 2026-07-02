# Standup App

Daily standup tracking application with multi-tenant account support.

Built as a learning project while working through [*Build a SaaS App in Rails*](https://buildasaasappinrails.com/), part of a 12-week job-readiness track. For context and sprint plans, see the [productivity system](#related-docs).

## Tech Stack

- **Ruby** 3.4.8, **Rails** 8.1, **PostgreSQL**
- **Hotwire** (Turbo + Stimulus), **Importmap**
- **Bulma** CSS
- **RSpec**, **FactoryBot**, **Capybara**, **SimpleCov**

## Setup

```bash
bundle install
bin/rails db:setup
bin/dev
```

Open http://localhost:3000.

## Testing

```bash
bundle exec rspec
bundle exec rspec spec/models/
bundle exec rspec spec/requests/
bundle exec rspec spec/system/
```

## Routes

| Path | Purpose |
|------|---------|
| `/` | Activity feed (root) |
| `/session/new` | Log in |
| `/registrations/new` | Sign up |
| `/passwords/new` | Forgot password |
| `/activity/mine` | My activity |
| `/activity/feed` | Activity feed |
| `/support` | Support page |
| `/up` | Health check |
| `/rails/info/routes` | Routes overview (dev only) |

## Features

- **Authentication** — Email/password via bcrypt, cookie-based sessions
- **Registration** — Sign-up with auto-created account
- **Password reset** — Email-based reset (letter_opener in dev)
- **Activity pages** — Track and view daily activity
- **Multi-tenant** — Account has owner + members (User/Account model)
- **Authorization** — Pundit (ready for policies)
- **Role management** — Rolify (ready for roles)
- **Background jobs** — Solid Queue
- **Caching** — Solid Cache
- **Real-time** — Action Cable via Solid Cable

## Database

Three main tables: `users`, `accounts`, `sessions`.  
Accounts are the tenant — users belong to an account, and each account has an owner.

```
User (1) ---< (N) Session
User (N) >--- (1) Account   (optional for User)
Account (1) ---< (N) User
```

## Key Dependencies

- `bcrypt` — Password hashing
- `pundit` — Authorization policies
- `rolify` — Role management
- `local_time` — Client-side time rendering
- `prefixed_ids` — Prefixed record IDs (e.g., `u_abc123`)
- `solid_cache`, `solid_queue`, `solid_cable` — Rails Solid stack
- `kamal` — Docker deployment

## Deployment

```bash
docker build -t standup_app .
kamal deploy
```

## Related Docs

Sprint plans, milestones, and learning reflections live in the Obsidian vault:

| File | Purpose |
|------|---------|
| `01.Projects/Rails/build-saas-app-rails/_milestones.md` | Chapter-by-chapter milestones |
| `01.Projects/Rails/build-saas-app-rails/_priorities.md` | Weekly sprint plan |
| `01.Projects/Tech-Job/job-ready-plan.md` | 12-week track overview |
| `01.Projects/Tech-Job/_priorities.md` | Cross-project weekly priorities |
