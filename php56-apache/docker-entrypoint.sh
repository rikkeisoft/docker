#!/bin/bash
# Remove http.pid & tmp
rm -rf /run/httpd/* /tmp/httpd*
exec /usr/sbin/apachectl -D FOREGROUND
