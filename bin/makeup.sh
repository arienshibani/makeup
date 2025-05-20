#!/usr/bin/env bash
#
# makeup — find the nearest Makefile upward, then run make there

# Remember where we started before we start traversing upwards.
orig="$PWD"

# Climb up until we find a Makefile
while true; do
  if [[ -f "$PWD/Makefile" ]]; then
    # Execute make in that directory with all passed args
    exec make -C "$PWD" "$@"
  fi

  # If we hit root, error out
  if [[ "$PWD" == "/" ]]; then
    echo "makeup: no Makefile found (searched up from $orig)" >&2
    exit 1
  fi

  cd .. || exit 1
done
