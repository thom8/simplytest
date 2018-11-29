#!/usr/bin/env bash

if [ ! -z "$PACKAGE" ]; then
  echo "Installing $PACKAGE"
  composer -vvv --working-dir=/drupal require $PACKAGE --ansi
fi

exec "$@"
