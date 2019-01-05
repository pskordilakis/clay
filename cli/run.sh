#! /usr/bin/env bash
#
# Run migrations against the database

function run {
    if [[ ! -f $1 ]]; then
        printf "%s\n" "File $1 does not exist" 1>&2
        exit 1
    fi

    # Import database
    docker-compose exec -T mysql mysql -uroot -ptopsecret clay < $1

    # Run
    docker-compose run node node ./dist/clay.cjs.js

    # export new database
    docker-compose exec mysql mysqldump -uroot -ptopsecret --no-create-info clay > $2
}
