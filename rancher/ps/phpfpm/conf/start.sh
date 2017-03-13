#!/usr/bin/env bash

shutdown() {
  echo 'gracefully shutting down...'
  kill -s QUIT ${pid}
  wait ${pid}
  exit $?
}

trap shutdown EXIT

sed -ie 's/;process_control_timeout = 0/process_control_timeout = 1m/' /etc/php/7.1/fpm/php-fpm.conf
/usr/sbin/php-fpm7.1 --nodaemonize --fpm-config /etc/php/7.1/fpm/php-fpm.conf &

pid=$!
wait ${pid}
