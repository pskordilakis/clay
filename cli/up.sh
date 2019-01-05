#! /usr/bin/env bash
#
# Initialzie environment

function up {
    # Start docker services
    docker-compose up -d

    # Install deps
    docker-compose run node yarn install
}
