#!/bin/bash
set -e

if [ "$1" = '' ]; then
  rm -rf /run/httpd/* /tmp/httpd*
  set -- /usr/sbin/apachectl -D FOREGROUND
fi

echo "$@"
exec "$@"
