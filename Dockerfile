FROM alpine

MAINTAINER Gnitry <gnitry@gmail.com>

ENV AUTOSSH_ARGS="-M 0 -N -o StrictHostKeyChecking=no -o ServerAliveInterval=5 -o ServerAliveCountMax=1"
ENV SSH_ARGS="-t -4 -L *:1234:127.0.0.1:1234 -p 22 user@11.22.33.44"

RUN apk add --update openssh-client && apk add autossh && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/*

CMD eval $(ssh-agent -s) && cat /id_rsa | ssh-add -k - && echo "autossh $AUTOSSH_ARGS $SSH_ARGS" && autossh $AUTOSSH_ARGS $SSH_ARGS
