#!/usr/bin/env bash

JETBRAINS_USER_NAME=jetbrains
JETBRAINS_USER_ID=2000

# create user if not exist
if [ $(getent passwd ${JETBRAINS_USER_NAME}) ]; then
    echo "user ${JETBRAINS_USER_NAME} already exists"
else
    echo "creating user ${JETBRAINS_USER_NAME}"
    groupadd --gid ${JETBRAINS_USER_ID} ${JETBRAINS_USER_NAME}
    useradd --system --uid ${JETBRAINS_USER_ID} --gid ${JETBRAINS_USER_NAME} ${JETBRAINS_USER_NAME}
fi

# create directory if not exist
if [ -d teamcity-agent/conf ]; then
    echo "directory teamcity-agent/conf already exist"
else
    mkdir --mode 770 --verbose --parents teamcity-agent/conf
fi

chmod --recursive 770 teamcity-agent
chown --changes --verbose --recursive ${JETBRAINS_USER_NAME}:pojo teamcity-agent

#run docker
docker-compose up -d --force-recreate