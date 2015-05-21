#!/bin/bash

# DefaultDir=/var/www/levpoem.co.il
DefaultDir=/var/www/$SITE
DefaultCmd="hugo -t redlounge -d $DefaultDir"
#remove possibly existing site
# rm -rf /site/public/*

# Check for no arguments -> run default
if [[ $# -eq 0 ]]; then
echo $DefaultCmd
exec $DefaultCmd
fi

# Regexs for checking commands
valid_switch='(^\-[bdDhstvw])'
valid_command='(server|version|config|check|benchmark|new|help)'

if [[ "$1" =~ $valid_command || "$1" =~ $valid_switch ]]; then
  echo hugo "$@"
  exec hugo "$@" # 1st parameter is a valid hugo command
fi

# Just run anything else
echo "$@"
exec "$@"
