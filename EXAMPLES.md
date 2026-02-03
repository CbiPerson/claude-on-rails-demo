# Example Workflows

Three end-to-end examples showing what happens when you give the swarm a prompt. Each shows the prompt you type, which agents get activated, what files are created, and key takeaways.

---

## Example 1: Add a Simple Page

### The Prompt

```
Add a Contact page with a heading, a paragraph of placeholder text, and a link back to the home page.
```

### What Happens

```
You  -->  Architect
            |
            +--> Controllers agent
            |      Creates route and controller
            |
            +--> Views agent
                   Creates the ERB template
```

### Agents Activated

| Agent | What it does |
|-------|-------------|
| **Architect** | Reads the prompt, decides only Controllers and Views are needed (no database, no JS) |
| **Controllers** | Adds `get "contact"` to `config/routes.rb`, creates `app/controllers/contact_controller.rb` with an `index` action |
| **Views** | Creates `app/views/contact/index.html.erb` with a heading, paragraph, and home link |

### Files Created / Modified

```
config/routes.rb                          # added: get "contact", to: "contact#index"
app/controllers/contact_controller.rb     # new: ContactController with index action
app/views/contact/index.html.erb          # new: HTML template
```

### Key Takeaway

For simple pages, the Architect only activates the agents that are needed. No database means the Models agent is never called. No JavaScript means the Stimulus agent stays idle. The swarm is efficient -- it doesn't do unnecessary work.

---

## Example 2: Full-Stack Blog

### The Prompt

```
Create a Blog feature. A post has a title (string) and body (text). Include a model with
validations, full CRUD controller, all views (index, show, new, edit), and tests for
everything.
```

### What Happens

```
You  -->  Architect
            |
            +--> Models agent
            |      Creates migration, model, validations
            |
            +--> Controllers agent
            |      Creates routes, controller with all CRUD actions
            |
            +--> Views agent
            |      Creates index, show, new, edit, _form partial
            |
            +--> Tests agent
                   Creates model test + controller test
```

### Agents Activated

| Agent | What it does |
|-------|-------------|
| **Architect** | Recognizes this is full-stack, activates Models, Controllers, Views, and Tests |
| **Models** | Creates a migration (`CreatePosts` with title:string, body:text), `Post` model with `validates :title, presence: true` |
| **Controllers** | Adds `resources :posts` to routes, creates `PostsController` with index/show/new/create/edit/update/destroy actions and strong params |
| **Views** | Creates `index.html.erb` (post list), `show.html.erb` (single post), `new.html.erb` and `edit.html.erb` (forms), `_form.html.erb` (shared partial) |
| **Tests** | Creates `test/models/post_test.rb` (validation tests) and `test/controllers/posts_controller_test.rb` (CRUD request tests) |

### Files Created / Modified

```
db/migrate/XXXXXX_create_posts.rb         # new: migration
app/models/post.rb                        # new: model with validations
config/routes.rb                          # modified: added resources :posts
app/controllers/posts_controller.rb       # new: full CRUD controller
app/views/posts/index.html.erb            # new: post listing
app/views/posts/show.html.erb             # new: single post view
app/views/posts/new.html.erb              # new: new post form
app/views/posts/edit.html.erb             # new: edit post form
app/views/posts/_form.html.erb            # new: shared form partial
test/models/post_test.rb                  # new: model tests
test/controllers/posts_controller_test.rb # new: controller tests
```

### Key Takeaway

A single prompt produces a complete, working feature across all Rails layers. The agents follow Rails conventions: RESTful routes, strong parameters, form partials, and both model and controller tests. You get the same structure an experienced Rails developer would write.

---

## Example 3: Background Jobs

### The Prompt

```
When a new user signs up, send them a welcome email in the background. Create the User
model, a WelcomeMailer, and a SendWelcomeEmailJob that the model triggers after creation.
```

### What Happens

```
You  -->  Architect
            |
            +--> Models agent
            |      Creates User model with after_create callback
            |
            +--> Jobs agent
            |      Creates mailer and background job
            |
            +--> Tests agent
                   Creates model, job, and mailer tests
```

### Agents Activated

| Agent | What it does |
|-------|-------------|
| **Architect** | Identifies three concerns: data model, async processing, and tests |
| **Models** | Creates `User` migration (name, email), model with `after_create :send_welcome_email` that enqueues the job |
| **Jobs** | Creates `SendWelcomeEmailJob` (calls the mailer) and `WelcomeMailer` with a `welcome` action (subject, template) |
| **Tests** | Creates `test/models/user_test.rb`, `test/jobs/send_welcome_email_job_test.rb`, and `test/mailers/welcome_mailer_test.rb` |

### Files Created / Modified

```
db/migrate/XXXXXX_create_users.rb             # new: migration
app/models/user.rb                            # new: model with callback
app/jobs/send_welcome_email_job.rb            # new: ActiveJob job
app/mailers/welcome_mailer.rb                 # new: mailer class
app/views/welcome_mailer/welcome.html.erb     # new: email template
app/views/welcome_mailer/welcome.text.erb     # new: plain text email
test/models/user_test.rb                      # new: model tests
test/jobs/send_welcome_email_job_test.rb      # new: job tests
test/mailers/welcome_mailer_test.rb           # new: mailer tests
```

### Key Takeaway

The swarm handles cross-cutting concerns naturally. The Models agent creates the trigger, the Jobs agent creates both the job and the mailer, and the Tests agent covers all three. Each agent works in its own directory but the result is a cohesive feature.

---

## Try It Yourself

Start the swarm with `claude-swarm` and try any of the prompts above. Or make up your own -- the agents can handle anything Rails can do.

See [GETTING_STARTED.md](GETTING_STARTED.md) if you haven't set up the project yet.
