# Docker svn client image

FROM ubuntu:12.04
MAINTAINER Alexandre <aoudin@parkeon.com>
RUN apt-get update && apt-get install -y curl zip unzip libtool libserf1 libserf-dev libneon27 libneon27-dev make vim

ADD https://archive.apache.org/dist/subversion/subversion-1.5.9.tar.gz /tmp
ADD https://archive.apache.org/dist/subversion/subversion-deps-1.5.9.tar.gz /tmp

RUN cd /tmp \
  && tar xzvf subversion-1.5.9.tar.gz \
  && tar xzvf subversion-deps-1.5.9.tar.gz \
  && cd subversion-1.5.9 \
  && ./configure --with-neon=/usr/local/myneon/ \
  && make \
  && make install
