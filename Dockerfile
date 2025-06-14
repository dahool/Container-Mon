# Build the app
FROM golang:1.24-alpine AS build

WORKDIR /build
COPY . .
RUN go build app.go

# Run the app
FROM alpine:latest

LABEL org.opencontainers.image.source https://github.com/RafhaanShah/Container-Mon

WORKDIR /app
COPY --from=build /build/app /app
ENTRYPOINT ["./app"]
