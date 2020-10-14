#!/usr/bin/env bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

start()
{

exec /usr/sbin/apachectl -DFOREGROUND  
}


start1()
{

exec /usr/sbin/sshd -D 
}
case "$1" in
START)
        start
        ;;
SSH)
        start1
        ;;
*)
        echo "Invalid Environment, check with Linux Team"
        exec "$@"
        ;;
esac
