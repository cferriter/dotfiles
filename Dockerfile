FROM ubuntu:22.04

# Set the time zone to avoid interactive questions while testing install.sh.
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    apt-get update -y && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

WORKDIR /root/dotfiles
COPY . .
RUN ./install.sh
