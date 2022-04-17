# development build
FROM golang as development

WORKDIR /go/app

COPY hello.go .

RUN go mod init fullcycle/hello && \
    go build -o hello.go

# production build
FROM scratch

WORKDIR /app

COPY --from=development /go/app .

CMD [ "./hello.go"]