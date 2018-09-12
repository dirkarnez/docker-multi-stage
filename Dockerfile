FROM golang:alpine AS build
ADD ./src /go/src/github.com/company/helloworld
RUN go install github.com/company/helloworld && cd /go/bin && ls

FROM alpine
COPY --from=build /go/bin/helloworld /usr/bin/helloworld
ENTRYPOINT [ "/usr/bin/helloworld" ]