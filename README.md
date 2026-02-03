# claude-on-rails-demo

A working demo of [claude-on-rails](https://github.com/CbiPerson/claude-on-rails) -- an AI agent swarm for Rails development.

This Rails app was generated from the [swarmpod-core](https://github.com/CbiPerson/swarmpod-core) template, then configured with claude-on-rails to show how a full agent team gets set up on a real project.

## What's Inside

- A Rails 8.1 app with the SwarmPod home page and lesson cards
- A complete `claude-swarm.yml` defining 8 specialized agents:
  - **Architect** -- coordinates development across the team
  - **Models** -- ActiveRecord, migrations, database design
  - **Controllers** -- routing and request handling
  - **Views** -- templates, layouts, partials
  - **Stimulus** -- Turbo and Stimulus.js integration
  - **Jobs** -- background processing with ActiveJob
  - **Tests** -- test coverage (Minitest)
  - **DevOps** -- deployment, Docker, CI/CD
- Agent prompts in `.claude-on-rails/prompts/` customized for this project

## Try It Yourself

```bash
git clone https://github.com/CbiPerson/claude-on-rails-demo.git
cd claude-on-rails-demo
bundle install
claude-swarm
```

Then describe what you want to build:

```
> Add a user registration system with email confirmation
```

The swarm coordinates implementation across all Rails layers automatically.

## How This Was Built

This demo was created by following the [NEWBIE.md](https://github.com/CbiPerson/claude-on-rails/blob/main/NEWBIE.md) guide:

1. Generated a Rails app from the swarmpod-core template
2. Added `claude-on-rails` to the Gemfile
3. Ran `rails generate claude_on_rails:swarm`

That's it. Three steps.

## Related

- [claude-on-rails](https://github.com/CbiPerson/claude-on-rails) -- the gem
- [swarmpod-core](https://github.com/CbiPerson/swarmpod-core) -- the Rails template used as a starting point
- [claude-swarm](https://github.com/parruda/claude-swarm) -- the underlying agent orchestration framework
