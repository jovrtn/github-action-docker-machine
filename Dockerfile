FROM docker:latest

LABEL "com.github.actions.name"="GitHub Action Docker Machine"
LABEL "com.github.actions.description"="An action for docker-machine"
LABEL "com.github.actions.icon"="chevrons-right"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/jovrtn/github-action-wpengine-git-deploy"
LABEL "maintainer"="Jesse L.K. Overton <jesse@ovrtn.com>"

RUN apk update && apk add curl openssh bash

# docker-machine
RUN curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine
RUN install /tmp/docker-machine /usr/local/bin/docker-machine
RUN mkdir -p /root/.docker

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
