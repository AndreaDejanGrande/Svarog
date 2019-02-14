#
# Dockerfile for Svarog
# usage: docker run creack/svarog --url xxxx --user xxxx --pass xxxx
# ex: docker run creack/svarog --url stratum+tcp://svarog.jugoslaven.com:9333 --user DejanGrande.Svarog --pass 1234
#
#

FROM            ubuntu:14.04
MAINTAINER      Guillaume J. Charmes <guillaume@charmes.net>

RUN             apt-get update -qq && \
                apt-get install -qqy automake libcurl4-openssl-dev git make

RUN             git clone https://github.com/AndreaDejanGrande/Svarog

RUN             cd Svarog && \
                ./autogen.sh && \
                ./configure CFLAGS="-O3" && \
                make

WORKDIR         /Svarog
ENTRYPOINT      ["./svarog"]
