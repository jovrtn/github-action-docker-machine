FROM docker:dind

LABEL "com.github.actions.name"="GitHub Action Docker Machine"
LABEL "com.github.actions.description"="An action for docker-machine"
LABEL "com.github.actions.icon"="chevrons-right"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/jovrtn/github-action-wpengine-git-deploy"
LABEL "maintainer"="Jesse L.K. Overton <jesse@ovrtn.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
