#!/bin/bash

# setup environment
curl -fsSL https://packages.redis.io/gpg |  gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" |  tee /etc/apt/sources.list.d/redis.list

# install redis
apt-get install redis -y

# launch redis in foreground
redis-server --daemonize no --port 6379 --protected-mode no
