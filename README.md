## Dependencies

* Ruby 3.1.0
## Apps info
 * Rails app runs in port 4567 (using this default config)

## Local Development
## Full install

1. Install dependencies
```
\curl -sSL https://get.rvm.io | bash
rvm install "ruby-3.1.0"
rvm use 3.1.0
brew install postgresql
```

2. Clone repository
3. cd into repository folder

4. Run in command line next:

```
gem install bundler && bundle config jobs 7
```

5. Replace file with credentials of local postgres db(in development section)
```
database.yml
```

6. Run in command line next:
```
bundle install
```

7. Setup db:
```
rails db:create
rails db:migrate
```

you can also seed data:

```
rails db:seed
```

8. run backend (on aterminal window)
```
rails server --binding 0.0.0.0 --port 4567
```
