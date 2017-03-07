#!/bin/sh
docker build --build-arg ADMIN_PASSWORD=welcome2 -t jeqo/weblogic-domain:02-v2 .
