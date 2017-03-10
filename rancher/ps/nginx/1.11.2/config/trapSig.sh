#!/bin/bash

echo 'started trap sig!!!!!!!!!!!!!!!!!!!!!!!!'

# 1     SIGHUP
# 2     SIGINT
# 3     SIGQUIT
# 6     SIGABRT
# 9     SIGKILL
# 14    SIGALRM
# 15    SIGTERM
for sig in 1 2 3 6 9 14 15; do
    trap 'echo "caught signal '$sig'................................"' $sig
done

while [[ true ]]; do
  sleep 5
  echo 'looping...'
done
