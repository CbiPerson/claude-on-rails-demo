# Getting Started

This guide walks you from zero to a running agent swarm. No prior Rails or AI experience required.

---

## Step 1: Install Prerequisites

You need five tools. Most are one-line installs.

### Ruby 3.4.5

**macOS (with Homebrew):**
```bash
brew install rbenv ruby-build
rbenv install 3.4.5
rbenv global 3.4.5
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install -y autoconf bison build-essential libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
rbenv install 3.4.5
rbenv global 3.4.5
```

Verify: `ruby -v` should show `3.4.5`.

### Bundler

```bash
gem install bundler
```

### SQLite3

**macOS:** Usually pre-installed. Check with `sqlite3 --version`.

**Linux:**
```bash
sudo apt-get install -y sqlite3 libsqlite3-dev
```

### Claude CLI

Follow the official install guide: [Claude Code overview](https://docs.anthropic.com/en/docs/claude-code/overview)

Verify: `claude --version` should print a version number.

### claude-swarm

```bash
gem install claude-swarm
```

Verify: `claude-swarm --version` should print a version number.

---

## Step 2: Clone and Set Up

```bash
git clone https://github.com/CbiPerson/claude-on-rails-demo.git
cd claude-on-rails-demo
bin/quickstart
```

The `bin/quickstart` script will:
1. Check that all prerequisites are installed
2. Run `bundle install` to fetch Ruby gems
3. Run `bin/rails db:prepare` to set up the SQLite database
4. Print next steps

If any check fails, it will tell you exactly what to install.

---

## Step 3: Start the Rails Server

```bash
bin/rails server
```

Open your browser to [http://localhost:3000](http://localhost:3000). You should see the home page with lesson cards.

Browse around:
- [http://localhost:3000/guide](http://localhost:3000/guide) -- in-app getting started guide
- [http://localhost:3000/examples](http://localhost:3000/examples) -- example workflows
- [http://localhost:3000/next](http://localhost:3000/next) -- architecture explainer

---

## Step 4: Launch the Swarm

Open a **second terminal** (keep the Rails server running in the first one).

```bash
cd claude-on-rails-demo
claude-swarm
```

You'll see the Architect agent start up. It's now waiting for your instructions.

---

## Step 5: Try a First Prompt

Type this into the swarm:

```
Add a Contact page with a name field, email field, and a submit button. Include a controller test.
```

Watch what happens:
1. The **Architect** breaks the task into pieces
2. The **Controllers** agent creates a route and controller
3. The **Views** agent creates the HTML template
4. The **Tests** agent writes a controller test

When it's done, refresh your browser -- the new page should be live at `/contact`.

### More prompts to try

```
Add a Blog with title and body fields. Include a migration, model, controller, and views.
```

```
Create a background job that sends a welcome email when a user signs up.
```

See [EXAMPLES.md](EXAMPLES.md) for detailed walkthroughs of these scenarios.

---

## Troubleshooting

### `command not found: ruby`
Ruby isn't installed or isn't on your PATH. If you used rbenv, make sure you added it to your shell profile:
```bash
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
```

### `command not found: claude`
The Claude CLI isn't installed. Follow the [install guide](https://docs.anthropic.com/en/docs/claude-code/overview).

### `command not found: claude-swarm`
Install it with `gem install claude-swarm`. If you get a permissions error, use `gem install --user-install claude-swarm`.

### `bundle install` fails
Make sure you have build tools installed:
- macOS: `xcode-select --install`
- Linux: `sudo apt-get install build-essential`

### `sqlite3.h: No such file or directory`
SQLite3 development headers are missing:
- macOS: `brew install sqlite3`
- Linux: `sudo apt-get install libsqlite3-dev`

### The swarm starts but agents seem confused
Make sure you're running `claude-swarm` from the project root directory (where `claude-swarm.yml` lives).

### Port 3000 already in use
Another process is using port 3000. Either stop it or run Rails on a different port:
```bash
bin/rails server -p 3001
```
