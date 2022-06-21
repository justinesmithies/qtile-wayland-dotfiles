#!/bin/bash

# Supress error codes to stop issues with CheckUpdates widget
#checkupdates 2> /dev/null
#paru -Qua 2> /dev/null
#exit 0

case $1 in
  key-update)
		kitty -e paru
		qtile cmd-obj -o widget checkupdates -f force_update
    ;;
  *)
		# Supress error codes to stop issues with CheckUpdates widget
		checkupdates 2> /dev/null
		paru -Qua 2> /dev/null
		exit 0
    ;;
esac
