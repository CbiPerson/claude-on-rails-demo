# ClaudeOnRails Context

This is a **demo and learning application** for [claude-on-rails](https://github.com/CbiPerson/claude-on-rails). It shows how an AI agent swarm gets configured on a real Rails project. The app itself is intentionally simple -- the value is in the swarm configuration, not the application logic.

## Project Information
- **Rails Version**: 8.1.2
- **Ruby Version**: 3.4.5
- **Project Type**: Full-stack Rails
- **Test Framework**: Minitest
- **Turbo/Stimulus**: Enabled

## Application Structure

The app has four pages:

| Route | Controller | Purpose |
|-------|-----------|---------|
| `/` | HomeController | Home page with lesson cards |
| `/next` | NextController | Architecture explainer ("What's Next") |
| `/guide` | GuideController | Step-by-step getting started guide |
| `/examples` | ExamplesController | Example swarm workflow walkthroughs |

All pages share a consistent dark-theme design with a navigation bar. Views use **inline CSS** (no external stylesheets or CSS framework) to keep the demo self-contained.

## Agent Overview

The swarm is defined in `claude-swarm.yml` with 8 agents:

- **Architect** (main) -- entry point, coordinates the team, can delegate to all other agents
- **Models** -- ActiveRecord, migrations, database design
- **Controllers** -- routing and request handling
- **Views** -- templates, layouts, partials (can delegate to Stimulus)
- **Stimulus** -- Turbo and Stimulus.js integration
- **Jobs** -- background processing with ActiveJob
- **Tests** -- test coverage with Minitest
- **DevOps** -- deployment, Docker, CI/CD

Each agent has a prompt file in `.claude-on-rails/prompts/` and is scoped to a specific directory.

## Swarm Configuration

The claude-swarm.yml file defines specialized agents for different aspects of Rails development:
- Each agent has specific expertise and works in designated directories
- Agents collaborate to implement features across all layers
- The architect agent coordinates the team

## Development Guidelines

When working on this project:
- Follow Rails conventions and best practices
- Write tests for all new functionality
- Use strong parameters in controllers
- Keep models focused with single responsibilities
- Extract complex business logic to service objects
- Ensure proper database indexing for foreign keys and queries
- Views use inline CSS -- keep this pattern for consistency
- This is a demo app -- keep things simple and well-documented
