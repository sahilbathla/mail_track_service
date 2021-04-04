# Mail Track Service

Mail Track Service allows you to create and track emails

# Pre-requisite

1. Install Ruby 2.6.5
1. Install Bundler
1. Install postgres and setup local environment
1. Setup Redis-Cli (Needed for Sidekiq)

# Setup

1. `bundle install`
1. Setup `database.yml`
1. Copy `config/application.yml.example` to `config/application.yml`*
1. `bundle exec rake db:create`
1. `bundle exec rakd db:migrate`
1. `bash scripts/install-hooks.bash` for rubocop checks
1. Start Server - `bundle exec rails s`
1. Start Sidekiq `bundle exec sidekiq`
1. `bin\spring stop` if required and doesn't work properly

***Note*** - Using env variables of `application.yml` instead of encrypted credentials for easy deployment to heroku

# Deploy

1. `git remote add origin <heroku_url>`
1. Setup environment variables in heroku dashboard
1. `git push origin <heroku_url>`
