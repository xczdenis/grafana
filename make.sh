#!/bin/bash

source load_env.sh
source ./scripts/logger.sh

COMPOSE_PROFILE_DEFAULT="--profile default"

run_docker_compose() {
    echo DOCKER_BUILDKIT="${DOCKER_BUILDKIT}" COMPOSE_PROJECT_NAME="${PROJECT_NAME}" docker-compose "$@"
}


# it just returns PONG
ping() {
    echo "PONG"
}


# display info about: current envs, project name etc.
info() {
    log_header "INFORMATION"
    echo "PROJECT_NAME        = ${PROJECT_NAME}"
    echo "DOCKER_IMG_PLATFORM = ${DOCKER_IMG_PLATFORM}"
}


# display info about running docker containers, images, volumes
di() {
    log_header "Running containers:"
    docker ps
    echo
    log_header "All containers:"
    docker ps -a
    echo
    log_header "Images:"
    docker images
    echo
    log_header "Volumes:"
    docker volume ls
    echo
    log_header "Networks:"
    docker network ls
}


env() {
    if [ -f .env ]; then
        read -p "File .env already exists. Overwrite it [y/n]: " yn
        case $yn in
            [Yy]* )
                cp .env.template .env
                echo "File .env has been overwritten!"
                ;;
            * )
                echo "Nothing happened."
                ;;
        esac
    else
        cp .env.template .env
        echo "File .env created from .env.template!"
    fi
}


down() {
    log_header "Down containers"
    run_docker_compose "${COMPOSE_PROFILE_DEFAULT}" down
}


case "$1" in
    down)
        down
        ;;
    ping)
        ping
        ;;
    info)
        info
        ;;
    di)
        di
        ;;
    env)
        env
        ;;
    *)
        echo "Usage: $0 {down|ping|info|di}"
        exit 1
        ;;
esac