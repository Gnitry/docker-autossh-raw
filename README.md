Lightweight AutoSSH Docker image with simple configuration.
The main advantage over other implementations is possibility to set multiple port forwardings.

### Configuration:

* Mount private key to "/id_rsa"
* Set AUTOSSH_ARGS environment variable. Optional. View Dockerfile or just run container to view default value.
* Set SSH_ARGS environment variable. View Dockerfile or just run container to view default value.

### docker example:

```bash
docker run -p 1111:1111 -p 2222:2222 -v /home/user/.ssh/id_rsa:/id_rsa -e SSH_ARGS="-t -4 -T -L *:1111:127.0.0.1:1111 -L *:2222:127.0.0.1:2222 user@11.22.33.44" gnitry/autossh-raw
```

### docker-compose example:

```YAML
version: '2.2'
services:
  tun:
    image: gnitry/autossh-raw
    restart: always
    volumes:
      - /home/user/.ssh/id_rsa:/id_rsa
    expose:
      - 1111
      - 2222
    environment:
      - SSH_ARGS=-t -4 -T user@11.22.33.44 -L *:1111:127.0.0.1:1111 -L *:2222:127.0.0.1:2222
```
