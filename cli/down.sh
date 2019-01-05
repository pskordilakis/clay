#! /usr/bin/env bash
#
# Run migrations against the database

function down {
    # cleanup
    docker-compose down -v
}
