FROM amazonlinux:latest

COPY programm.asm ./etc/asm/
COPY Makefile ./etc/asm/

RUN apt update
RUN apt install nasm gdb gcc nano -y

WORKDIR ./etc/asm/

CMD make

MAINTAINER Alexey Semenkov <sealekssaa@gmail.com>