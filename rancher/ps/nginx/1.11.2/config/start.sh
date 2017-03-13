#!/usr/bin/env bash

shutdown() {
  echo 'gracefully shutting down...'
  kill -s QUIT ${pid}
  wait ${pid}
  exit $?
}

trap shutdown EXIT

/usr/sbin/nginx &

pid=$!
wait ${pid}
