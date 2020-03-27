FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        libmaxminddb-dev \
        pkg-config

WORKDIR /build

RUN curl -sLO https://luajit.org/download/LuaJIT-2.1.0-beta3.tar.gz && \
    tar zxf LuaJIT-2.1.0-beta3.tar.gz

COPY lib/Makefile lib/maxminddb.c ./

RUN make maxminddb.so && \
    ldd maxminddb.so