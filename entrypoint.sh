#!/bin/sh -l

set -e

base=https://github.com/docker/machine/releases/download/v0.16.0 && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && sudo install /tmp/docker-machine /usr/local/bin/docker-machine

SSH_PATH="$HOME/.ssh"

mkdir "$SSH_PATH"

SSH_KEY_PRIVATE_PATH="$SSH_PATH/id_rsa"
SSH_KEY_PUBLIC_PATH="$SSH_PATH/id_rsa.pub"

echo "$SSH_KEY_PRIVATE" > "$SSH_KEY_PRIVATE_PATH"
echo "$SSH_KEY_PUBLIC" > "$SSH_KEY_PUBLIC_PATH"

chmod 700 "$SSH_PATH"
chmod 600 "$SSH_KEY_PRIVATE_PATH"
chmod 644 "$SSH_KEY_PUBLIC_PATH"

docker-machine create --driver generic --generic-ip-address=$DOCKER_MACHINE_IP --generic-ssh-key=$SSH_KEY_PRIVATE_PATH --generic-ssh-user=$SSH_USER --engine-storage-driver=overlay $DOCKER_MACHINE_NAME
