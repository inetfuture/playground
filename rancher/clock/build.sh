#!/bin/bash

docker build -t inetfuture.com/tests/clock:latest .
docker push inetfuture.com/tests/clock:latest
