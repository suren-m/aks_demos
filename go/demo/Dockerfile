# build
FROM golang:1.15.5-alpine3.12 as build
WORKDIR /build
ADD *.go /build
RUN CGO_ENABLED=0 GOOS=linux 
RUN go build -a -o demo .

# run
FROM alpine:3.12
COPY --from=build /build/demo .
ENTRYPOINT [ "./demo"]

