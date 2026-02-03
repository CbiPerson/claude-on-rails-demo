# claude-on-rails-demo

A working demo of [claude-on-rails](https://github.com/CbiPerson/claude-on-rails) -- an AI **agent swarm** for Rails development.

Instead of one AI assistant, you get a coordinated team: an architect that plans the work, and specialists for models, controllers, views, tests, and more. Each agent knows its domain and stays in its lane.

## What Is This?

Most AI coding tools give you a single chatbot. **claude-on-rails** gives you a _swarm_ -- multiple Claude agents that collaborate like a real development team:

1. You describe what you want in plain English
2. The **Architect** agent breaks it into tasks
3. Specialist agents (Models, Controllers, Views, Tests, ...) implement each piece
4. You get working code across every Rails layer

This repo is a ready-to-run example so you can see it in action.

## Prerequisites

| Tool | Why | Install |
|------|-----|---------|
| **Ruby 3.4.5** | Runs the Rails app | `brew install ruby` or [rbenv](https://github.com/rbenv/rbenv) |
| **Bundler** | Installs gems | `gem install bundler` |
| **SQLite3** | Default database | `brew install sqlite3` (usually pre-installed on macOS) |
| **Claude CLI** | Powers each agent | [Install guide](https://docs.anthropic.com/en/docs/claude-code/overview) |
| **claude-swarm** | Orchestrates the agents | `gem install claude-swarm` |

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/CbiPerson/claude-on-rails-demo.git
cd claude-on-rails-demo

# 2. Run the quickstart script (checks prereqs, installs deps, prepares DB)
bin/quickstart

# 3. Start the Rails server
bin/rails server

# 4. Open a second terminal and launch the swarm
claude-swarm
```

Then tell the swarm what to build:

```
> Add a Contact page with a name field and email field
```

The architect will coordinate the work across the specialist agents automatically.

## What's Inside

### Agent Team (defined in `claude-swarm.yml`)

| Agent | Role |
|-------|------|
| **Architect** | Coordinates the full team, plans implementation |
| **Models** | ActiveRecord, migrations, database design |
| **Controllers** | Routing and request handling |
| **Views** | Templates, layouts, partials |
| **Stimulus** | Turbo and Stimulus.js integration |
| **Jobs** | Background processing with ActiveJob |
| **Tests** | Test coverage (Minitest) |
| **DevOps** | Deployment, Docker, CI/CD |

### Pages

| URL | What it shows |
|-----|---------------|
| `/` | Home page with lesson cards |
| `/next` | Architecture explainer |
| `/guide` | Step-by-step getting started guide |
| `/examples` | Example swarm workflows |

### Project Structure

```
claude-swarm.yml              # Agent swarm configuration
.claude-on-rails/
  prompts/                    # Per-agent instruction files
  context.md                  # Shared project context
app/
  controllers/                # One controller per page
  views/                      # ERB templates with inline CSS
config/routes.rb              # Route definitions
test/controllers/             # Integration tests
```

## How the Swarm Works

```
You  -->  Architect  -->  Models agent      (creates migrations, model files)
                    -->  Controllers agent  (creates routes, controller actions)
                    -->  Views agent        (creates templates, partials)
                    -->  Tests agent        (creates test files)
                    -->  ...
```

The Architect reads your prompt, decides which agents to involve, and delegates. Each specialist works in its own directory with its own tools. The result is coordinated code across every layer -- just like a real team.

## Learn More

- **[GETTING_STARTED.md](GETTING_STARTED.md)** -- step-by-step setup from zero
- **[EXAMPLES.md](EXAMPLES.md)** -- full workflow walkthroughs
- **[claude-on-rails](https://github.com/CbiPerson/claude-on-rails)** -- the gem
- **[swarmpod-core](https://github.com/CbiPerson/swarmpod-core)** -- the Rails template used as a starting point
- **[claude-swarm](https://github.com/parruda/claude-swarm)** -- the underlying agent orchestration framework
