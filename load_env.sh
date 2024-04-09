#!/bin/bash

ENV_PATH="./.env"

if [ -f $ENV_PATH ]; then
    export $(grep -v "^#" "${ENV_PATH}" | xargs)
fi
