# Pull the golang version.
FROM golang:1.8-alpine
RUN apk add --update tini && rm -rf /var/cache/apk/*
ENV GOBINARIES /go/bin
RUN echo 'hosts: files [NOTFOUND=return] dns' >> /etc/nsswitch.conf
# Setup reflex env
ENV REFLEXURL=http://s3.amazonaws.com/wbm-raff/bin/reflex1.8a REFLEXSHA=19bdbbb68c869f85ee22a6b7fa9c73f8e5b46d0fe7a73df37e028555a6ba03e8
# Install reflex
WORKDIR $GOBINARIES
RUN wget -q "$REFLEXURL" -O reflex &&\
    echo "$REFLEXSHA  reflex" | sha256sum -c &&\
    chmod +x /go/bin/reflex
