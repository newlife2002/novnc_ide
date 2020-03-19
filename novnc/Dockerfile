FROM ubuntu:18.04
MAINTAINER newlife <newlife2002_313@sohu.com>

ENV VNC_PW "vncpsswd"

ENV DEBIAN_FRONTEND=noninteractive \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8 \
	DISPLAY=:0.0 \
	DISPLAY_WIDTH=1024 \
	DISPLAY_HEIGHT=768

RUN apt-get update -y && \
        apt-get install -qqy --no-install-recommends \
        supervisor xvfb x11vnc xterm fluxbox socat git ca-certificates && \
        mkdir ~/.vnc && \
        touch ~/.vnc/passwd



RUN git clone --recursive https://github.com/kanaka/noVNC.git /opt/novnc && \
        git clone --recursive https://github.com/kanaka/websockify.git /opt/novnc/utils/websockify && \
        ln -s /opt/novnc/vnc.html /opt/novnc/index.html



RUN apt-get autoclean && \
         apt-get autoremove && \
         rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
