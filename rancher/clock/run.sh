#!/bin/bash

stop() {
  echo "========================  stopping $(date +'%T.%N')"
}

run() {
  while [[ true ]]; do
    date +'%T.%N'
    sleep 1
  done
}

trap stop SIGTERM
nc -l -k 80 &
run
