#!/bin/bash
export BASE=$(pwd)

function dkupa {
  CD=$(pwd)
  cd $BASE
  docker-compose up
  exitcode=$?
  cd $CD
}

function dkdown {
  CD=$(pwd)
  cd $BASE
  docker-compose down
  exitcode=$?
  cd $CD
}

function dk {
  docker-compose run --rm app $@
}

function dktest {
  dk rspec -fd
}

function db_setup {
  docker-compose up -d db
  until docker exec -ti movie-api-db pg_isready -U postgres; do sleep 1;done
  docker exec -ti movie-api-db psql -U postgres -c "create database movie_api_test"
  dk rails db:migrate RAILS_ENV=test
  dk rails db:migrate RAILS_ENV=development
}
