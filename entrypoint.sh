#! /bin/bash
# entrypoint.sh

CLEANUP_MAKEFILE=
if [[ ! -f /gba/Makefile ]]; then
  echo "Using default Makefile"
  cp /usr/default/Makefile /gba
  CLEANUP_MAKEFILE=1
fi

make "$@"

exit_code=$?

if [[ -n "$CLEANUP_MAKEFILE" ]]; then
  rm /gba/Makefile
fi

exit $exit_code