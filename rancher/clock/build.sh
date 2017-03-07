#!/bin/bash

docker build -t docker.quncrm.com/tests/clock:latest .
docker push docker.quncrm.com/tests/clock:latest
