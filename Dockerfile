FROM debian:trixie-slim AS wav2c_builder

LABEL maintainer="Aaron Hansen <aaron.hansen@gatech.edu>"
# Copied/adapted from https://github.com/devkitPro/docker/blob/master/devkitarm/Dockerfile

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /wav2c

RUN apt-get update && \
    apt-get install -y build-essential wget unzip

RUN wget https://github.com/aaaronic/wav2c/archive/refs/heads/master.zip && \
    unzip -j master.zip && \
    make

FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y --no-install-recommends sudo ca-certificates wget && \
    apt-get clean

RUN ln -s /proc/self/mounts /etc/mtab

RUN wget https://apt.devkitpro.org/install-devkitpro-pacman && \
    chmod +x ./install-devkitpro-pacman && \
    sudo yes | ./install-devkitpro-pacman && \
    apt-get clean

ENV DEVKITPRO=/opt/devkitpro
ENV PATH=${DEVKITPRO}/tools/bin:$PATH

RUN dkp-pacman -Syyu --noconfirm --needed gba-dev && \
    yes | dkp-pacman -Scc
ENV DEVKITARM=${DEVKITPRO}/devkitARM

ADD entrypoint.sh /usr/local/bin
ADD Makefile /usr/default/Makefile
COPY --from=wav2c_builder /wav2c/wav2c /usr/local/bin

VOLUME ["/gba"]
WORKDIR /gba
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]