# Claude On Rails Demo

You are working on **ClaudeOnRailsDemo**, a demo application for [claude-on-rails](https://github.com/obie/claude-on-rails). Review the full agent context at `.claude-on-rails/context.md`.

## What This Project Is

This is a **developer-facing demo** that shows how claude-on-rails configures an AI agent swarm on a real Rails project. The app itself is intentionally simple -- the value is in the swarm configuration and the demo pages that explain it. The target audience is developers evaluating the tool.

**claude-on-rails** is a development gem (not user-facing). It generates a `claude-swarm.yml` and per-agent prompt files from your Rails project. **claude-swarm** then runs those agents in parallel via the Claude CLI. Each agent is a separate Claude instance scoped to a specific directory.

## Key Files

| File | Purpose |
|------|---------|
| `claude-swarm.yml` | Defines 8 agents, their roles, directory scopes, models, and connections |
| `.claude-on-rails/prompts/*.md` | Per-agent instruction files loaded as system prompts |
| `.claude-on-rails/context.md` | Shared project context injected into all agents |
| `Gemfile` | Includes `claude-on-rails` (dev), `swarmpod-core` (API key wiring) |

## Agent Swarm Architecture

The swarm has 8 agents defined in `claude-swarm.yml`:

- **architect** (main) -- entry point, sees entire project, delegates to all others
- **models** -- `./app/models` -- ActiveRecord, migrations, database
- **controllers** -- `./app/controllers` -- routing, request handling
- **views** -- `./app/views` -- ERB templates, layouts, partials (can delegate to stimulus)
- **stimulus** -- `./app/javascript` -- Turbo frames/streams, Stimulus controllers
- **jobs** -- `./app/jobs` -- ActiveJob, background processing
- **tests** -- `./test` -- Minitest specs and coverage
- **devops** -- `./config` -- Kamal deployment, Docker, CI/CD

All agents use the `opus` model. Agent connections are directional: architect delegates to all; views delegates to stimulus.

## Application Pages

| Route | Controller | Content |
|-------|-----------|---------|
| `/` | HomeController | Demo landing page -- showcases swarm config, agent tree, CLI commands, example workflow |
| `/guide` | GuideController | 5-step getting started walkthrough |
| `/examples` | ExamplesController | 3 example swarm workflows (simple page, full-stack blog, background jobs) |
| `/next` | NextController | Architecture explainer |

## Development Rules

- **Inline CSS only** -- views use `<style>` blocks, no external stylesheets or CSS frameworks
- **Dark theme** -- consistent GitHub-dark-inspired color scheme across all pages
- **Terminal blocks** -- CLI output is rendered with syntax-highlighted `<pre>` blocks styled to look like terminal windows
- **No emoji in code** unless explicitly requested
- **Rails 8.1.2 / Ruby 3.4.5** -- use current conventions
- **Minitest** for tests, not RSpec
- **Turbo/Stimulus** enabled via importmap-rails
- **Keep it simple** -- this is a demo, not a production app. Avoid over-engineering.

## Links

- Upstream gem: https://github.com/obie/claude-on-rails
- Demo fork: https://github.com/CbiPerson/claude-on-rails-demo
- Swarm orchestrator: https://github.com/parruda/claude-swarm
- API key wiring: https://github.com/CbiPerson/swarmpod-core
