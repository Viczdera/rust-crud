#BUILD STAGE
FROM rust:1.89-bullseye AS builder
WORKDIR /app
#accept build args
ARG DB_URL
ENV DB_URL=$DB_URL
COPY . .
RUN cargo build --release

#RELEASE STAGE
FROM buildpack-deps:bullseye
WORKDIR /usr/local/bin
COPY --from=builder /app/target/release/rust-crud .

CMD ["./rust-crud"]