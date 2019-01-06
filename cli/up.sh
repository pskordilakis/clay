#! /usr/bin/env bash
#
# Initialzie environment

function up {
    # Start docker services
    docker-compose up -d

    # Install deps
    docker-compose run --rm node yarn install
}
