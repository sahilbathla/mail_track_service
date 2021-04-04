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

# Demo

1. To send a new email send the following request, please use your own email

```
curl --location --request POST 'https://mail-tracker-service.herokuapp.com/api/emails' \
--header 'Authorization: jskdk2312A#1213$1=o' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": {
        "from": "info@decabits.com",
        "to": "sahil@decabits.com",
        "content": "<div>Hello World</div>",
        "subject": "Mailer tracker",
        "unique_id": "Id111"
    }
}'
```

1. If mail goes in spam, make sure to move it to inbox and open it again on email client.
1. Login to the dashboard at [https://mail-tracker-service.herokuapp.com](https://mail-tracker-service.herokuapp.com) with credentials

```
username: admin
password: admin123
```
1. Check the status of your email

# Deploy

1. `git remote add origin <heroku_url>`
1. Setup environment variables in heroku dashboard
1. `git push origin <heroku_url>`

# Pending things

1. Unit Test cases + Code coverage
1. Use deliver_later + sidekiq (Currently using deliver_now)
1. Use proper authentication for authorizing api + login instead of basic auth and basic api token check
1. Add styling to the dashboard
1. Address code optimization laid out in `Todo`
