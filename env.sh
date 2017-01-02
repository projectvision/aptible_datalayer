#!/bin/bash
set -e

# MAKE SURE YOU'VE SET ENVIROMENTS BEFORE DEPLOY
#
# Check if any set
# aptible config --app appname-name
#
# Set one 
# aptible config:add VAR=value --app appname-name
# 
# 
config_path='/usr/local/tomcat/webapps/datalayer/WEB-INF/classes/datalayerOverride.properties'

raise() {
  echo -e "Missing $1 env variable see aptible-cli how to set it" 1>&2
  exit 1
}
check_vars() {
  if [[ -z "${MONGO}" ]]; then
    raise "MONGO"
  fi
  if [[ -z "${SQL}" ]]; then
    raise "SQL"
  fi
}

check_vars

# config file path varies check with Dockerfile if needed
# candidate to move into environment variables
# 
echo -e "mongodb.uri=$MONGO\njdbc.url=$SQL\n" > $config_path
