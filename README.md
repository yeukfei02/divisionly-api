<p align="center">
  <img width="350px" src="https://github.com/yeukfei02/divisionly-api/blob/main/readme-icon.png?raw=true"><br/>
  <h2 align="center">divisionly-api</h2>
</p>

<p align="center">
  <a href="https://codecov.io/gh/yeukfei02/divisionly-api"><img src="https://codecov.io/gh/yeukfei02/divisionly-api/branch/main/graph/badge.svg?token=CT6XT3J9DM" alt=""></a>
</p>

split expenses with friends

documentation: <https://documenter.getpostman.com/view/3827865/UVBzoVbG>

api url: <https://divisionly-api.herokuapp.com/>

## Requirement

- install ruby (v2.7.4)
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

// run rails console
$ rails c

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

// run db seed
$ rails db:seed

// create worker file
$ rails g sidekiq:worker <workerName>

// list routes
$ rails routes

// run test case
$ bundle exec rspec

// start sidekiq
$ bundle exec sidekiq

// rubocop
$ rubocop --auto-correct

// reek
$ reek

// generate schema info in model
$ annotate --models
```

## Docker

```zsh
// build images and start container in one line
docker-compose up -d --build

// run db migration in container
docker-compose exec web bundle exec rails db:migrate

// go inside container
docker exec -it <containerId> /bin/bash

// check container logs
docker logs <containerId>

// remove and stop container
docker-compose down
```

open localhost:3000