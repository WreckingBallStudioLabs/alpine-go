# Pull the golang version.
FROM golang:1.9-rc-alpine
ENV GOBINARIES /go/bin
ENV REFLEXURL=http://s3.amazonaws.com/wbm-raff/bin/reflex1.8a REFLEXSHA=19bdbbb68c869f85ee22a6b7fa9c73f8e5b46d0fe7a73df37e028555a6ba03e8
WORKDIR $GOBINARIES
RUN apk add --update tini gcc curl && rm -rf /var/cache/apk/* &&\
    echo 'hosts: files [NOTFOUND=return] dns' >> /etc/nsswitch.conf &&\
    wget -q "$REFLEXURL" -O reflex &&\
    echo "$REFLEXSHA  reflex" | sha256sum -c &&\
    chmod +x /go/bin/reflex
