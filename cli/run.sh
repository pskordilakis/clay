#! /usr/bin/env bash
#
# Run migrations against the database

function run {
    # Import database
    docker-compose exec -T mysql mysql -uroot -ptopsecret clay < "$CLAY_HOME/app/db/$1"

    # Run
    docker-compose run node node ./dist/clay.cjs.js

    # export new database
    docker-compose exec mysql mysqldump -uroot -ptopsecret --no-create-info clay > "$CLAY_HOME/app/db/$2"
}
