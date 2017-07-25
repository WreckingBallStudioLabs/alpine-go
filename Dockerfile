# Pull the golang version.
FROM golang:1.9rc1-alpine3.6
ENV GOBINARIES /go/bin
ENV REFLEXURL=http://s3.amazonaws.com/wbm-raff/bin/reflex1.9b2 REFLEXSHA=870b86b5ba1b91a9610a9ea7b0c894294f0ff45be2f7a4604c9846df36720a1d
WORKDIR $GOBINARIES
RUN apk add --update tini curl gcc musl-dev && rm -rf /var/cache/apk/* &&\
    echo 'hosts: files [NOTFOUND=return] dns' >> /etc/nsswitch.conf &&\
    wget -q "$REFLEXURL" -O reflex &&\
    echo "$REFLEXSHA  reflex" | sha256sum -c &&\
    chmod +x /go/bin/reflex
