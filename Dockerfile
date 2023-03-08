FROM ubuntu

COPY ./target/release/etcd /usr/bin/etcd

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
    apt-get update && apt-get -y install wget \
    && wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb \
    && dpkg -i libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb \
    ; fi

EXPOSE 8080

CMD ["etcd"]
