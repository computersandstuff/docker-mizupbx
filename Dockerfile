FROM phusion/baseimage:bionic-1.0.0
MAINTAINER jshridha

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /config nobody && \
 chown -R nobody:users /home

RUN apt-get update &&  apt-get -y install xvfb x11vnc xdotool wget supervisor cabextract websockify net-tools

ENV WINEPREFIX /root/prefix32
ENV WINEARCH win32
ENV DISPLAY :0


# Install wine
RUN \
 dpkg --add-architecture i386 && \
 apt update -y && \
 apt install wine64 wine32 -y
RUN \
 cd /usr/bin/ && \
 wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
 chmod +x winetricks && \
 sh winetricks corefonts wininet

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD mizu.sh /root/mizu.sh
RUN chmod +x /root/mizu.sh

RUN mv /root/prefix32 /root/prefix32_original && \
    mkdir /root/prefix32

WORKDIR /root/
ADD novnc /root/novnc/

# Expose Port
EXPOSE 8042

CMD ["/usr/bin/supervisord"]
