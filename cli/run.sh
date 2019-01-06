#! /usr/bin/env bash
#
# Run migrations against the database

function run {
    # compile app
    docker-compose run --rm node yarn build

    # Import database
    docker-compose exec -T mysql mysql -uroot -ptopsecret clay < "$CLAY_HOME/app/db/$1"

    # Run
    docker-compose run --rm node node ./dist/clay.cjs.js

    # export new database
    docker-compose exec mysql mysqldump -uroot -ptopsecret --no-create-info clay > "$CLAY_HOME/app/db/$2"
}
