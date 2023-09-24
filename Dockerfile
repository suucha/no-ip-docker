FROM rust AS builder
WORKDIR /usr/local/src
RUN wget https://dmej8g5cpdyqd.cloudfront.net/downloads/noip-duc_3.0.0-beta.7.tar.gz \
    && tar xf noip-duc_3.0.0-beta.7.tar.gz \
    && cd noip-duc_3.0.0-beta.7 \
    && cargo build --release

FROM debian
COPY  --from=builder /usr/local/src/noip-duc_3.0.0-beta.7/target/release/noip-duc /usr/local/bin
ENTRYPOINT [ "noip-duc" ]
