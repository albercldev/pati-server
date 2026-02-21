FROM alpine:3.23

ENV RCON_HOST server
ENV RCON_PASSWORD minecraft
ENV SSH_USER ""
ENV SSH_HOST ""
ENV SSH_PATH ""
VOLUME [ "/data" ]
VOLUME [ "/root/.ssh/id" ]

RUN apk add --no-cache tar pigz curl openssh-client rsync pv docker-cli

RUN wget https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz \
    && tar -xzf rcon-0.10.3-amd64_linux.tar.gz \
    && mv rcon-0.10.3-amd64_linux/rcon /usr/local/bin/rcon-cli \
    && rm -rf rcon-0.10.3-amd64_linux rcon-0.10.3-amd64_linux.tar.gz

RUN mkdir -p /backups /ssh

COPY backup.sh /backup.sh

RUN chmod +x /backup.sh

ENTRYPOINT ["/backup.sh"]