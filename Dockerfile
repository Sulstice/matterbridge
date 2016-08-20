FROM alpine:edge
ENTRYPOINT ["/bin/matterbridge"]

COPY . /go/src/github.com/42wim/matterbridge
RUN apk update && apk add go git gcc musl-dev ca-certificates \
        && cd /go/src/github.com/42wim/matterbridge \
        && export GOPATH=/go \
        && go get \
        && go build -o /bin/matterbridge \
        && rm -rf /go \
        && apk del --purge git go gcc musl-dev
