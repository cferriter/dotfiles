FROM ubuntu:22.04

# Set the time zone to avoid interactive questions while testing install.sh.
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    apt-get update -y && \
    apt-get install -y tzdata && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Set the locale to make sure UTF-8 is supported.
RUN apt-get -y install locales && \
    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

WORKDIR /root/dotfiles
COPY . .
RUN ./install.sh
