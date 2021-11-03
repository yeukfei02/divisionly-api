# sweet-factory-backend-rails

sweet-factory-backend-rails

documentation: <https://documenter.getpostman.com/view/3827865/UVBzoVbG>

api url: <>

## Requirement

- install ruby (v2.7.2)
- install gem
- install bundle
- install yarn
- install node (v14+)

## Testing and run

```zsh
// install ruby dependencies
$ bundle install

// install node dependencies
$ yarn

// run api in local
$ rails s

// create controller
$ rails g controller <controllerName>

// create model
$ rails g model <modelName>

// create migration file
$ rails g migration <migrationName>

// db migration
$ rails db:migrate

// db rollback
$ rails db:rollback

// db migration up
$ rails db:migrate:up

// db migration down
$ rails db:migrate:down

// list routes
$ rails routes

// rubocop
$ rubocop --auto-correct

// reek
$ reek
```