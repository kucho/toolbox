# Toolbox

## Development

### Requirements
1. Install [rubyfmt](git@github.com:fables-tales/rubyfmt.git) for your editor.
2. Postgres 14 or higher.
3. [asdf](git@github.com:asdf-vm/asdf.git) or other version manager for Ruby.
4. Install the ruby version specified in `.tools-versions`.
5. Install [direnv](https://github.com/direnv/direnv/blob/master/docs/installation.md).
6. [Hook](https://github.com/direnv/direnv/blob/master/docs/hook.md) direnv to your shell.

### Steps
1. Copy `env.example` to `.env`: `cp env.example .env`
2. Allow your `.env` using direnv: `direnv allow .`
3. Run the app using: `bin/dev`

### Notes
If you want to debug the application, it's better to run all scripts manually. Check `Procfile.dev`to know which commands to run!
