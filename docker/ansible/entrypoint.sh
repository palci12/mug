#!/bin/bash

#if [ -d /docker-entrypoint.d ]; then
#	for f in /docker-entrypoint.d/*.sh; do
#		[ -f "$f" ] && . "$f"
#	done
#fi

echo "RUN_SSH=$RUN_SSH"
echo "RUN_IN_FOREGROUND=$RUN_IN_FOREGROUND"
echo "FIXUID=$FIXUID"

if [ "$FIXUID" = "true" ]; then
  eval $( fixuid )
fi
if [ "$RUN_SSH" = "true" ]; then
  sudo /etc/init.d/ssh start
fi

if [ "$RUN_IN_FOREGROUND" = "true" ]; then
  tail -f /dev/null
fi

