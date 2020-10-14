#!/usr/bin/env bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

start()
{

exec /usr/sbin/sshd -D &
exec /usr/sbin/apachectl -DFOREGROUND  
}

case "$1" in
START)
        start
        ;;
*)
        echo "Invalid Environment, check with Linux Team"
        exec "$@"
        ;;
esac
