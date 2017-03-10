#!/usr/bin/env bash

shutdown() {
  echo 'gracefully shutting down nginx...'
  kill -s QUIT ${pid}
  while [[ true ]]; do
    date
    ps -ef | grep master | grep -v grep
    sleep 1
  done
}

trap shutdown SIGINT SIGHUP SIGQUIT SIGTERM

/usr/sbin/nginx &

pid=$!
wait ${pid}
