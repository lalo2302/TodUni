# TodUni
Collaborative tool for social projects.

## Install
Requires Ruby 2.3.0. Install it using [rvm](https://rvm.io/rvm/install):

```bash
rvm install 2.3.0
rvm use 2.3.0
rvm gemset create toduni
```

Then `cd` to the repo and do:

```bash
rvm use 2.3.0@toduni --rvmrc
cd .
rvm rvmrc to ruby-version
cd .
```

Ready, now just install required gems with:

```bash
gem install bundle
bundle install
```

## Local usage

The database configuration is at: `config/database.yml` Update with your databases' credentials and run migrations:

```bash
rake db:migrate RAILS_ENV=development
rake db:migrate RAILS_ENV=test
```

To run server on localhost:3000 run `rails server`.
