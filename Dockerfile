FROM debian:jessie

MAINTAINER Gavin de Kock

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN echo 'deb http://httpredir.debian.org/debian jessie non-free' >> /etc/apt/sources.list.d/jessie.non-free.list
RUN echo 'deb http://httpredir.debian.org/debian jessie-updates non-free' >> /etc/apt/sources.list.d/jessie.non-free.list
RUN echo 'deb http://security.debian.org/ jessie/updates non-free' >> /etc/apt/sources.list.d/jessie.non-free.list

RUN apt-get update
RUN apt-get install -y make unrar autoconf automake libtool gcc g++ gperf flex bison texinfo gawk ncurses-dev libexpat-dev python python-serial sed git unzip bash wget bzip2 libtool-bin

RUN useradd -ms /bin/bash -G dialout esp8266

USER esp8266
WORKDIR /home/esp8266

RUN git clone https://github.com/pfalcon/esp-open-sdk.git --recursive && cd esp-open-sdk && make
