# Pull the golang version.
FROM golang:1.9-rc-alpine
ENV GOBINARIES /go/bin
ENV REFLEXURL=http://s3.amazonaws.com/wbm-raff/bin/reflex1.9b2 REFLEXSHA=870b86b5ba1b91a9610a9ea7b0c894294f0ff45be2f7a4604c9846df36720a1d
ENV GOOSEURL=http://s3.amazonaws.com/wbm-raff/bin/goose1.9b2 GOOSESHA=b6c0f70f01c9d1b83a6642579b68d331ba3db35b0541be3d5a3f0b49d0822377
WORKDIR $GOBINARIES
RUN apk add --update tini curl musl-dev && rm -rf /var/cache/apk/* &&\
    echo 'hosts: files [NOTFOUND=return] dns' >> /etc/nsswitch.conf &&\
    wget -q "$REFLEXURL" -O reflex &&\
    echo "$REFLEXSHA  reflex" | sha256sum -c &&\
    chmod +x /go/bin/reflex &&\
    wget -q "$GOOSEURL" -O goose &&\
    echo "$GOOSESHA  goose" | sha256sum -c &&\
    chmod +x /go/bin/goose
