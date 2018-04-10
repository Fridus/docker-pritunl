FROM debian:9

RUN echo "deb http://repo.pritunl.com/stable/apt stretch main" >> /etc/apt/sources.list.d/pritunl.list && \
    apt-get update -qq && apt-get install -qq dirmngr && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A && \
    apt-get update -qq && \
    apt-get --assume-yes install pritunl mongodb-server

ADD ./start.sh /start.sh

EXPOSE 1194/udp 1195/udp 9700 443
CMD /start.sh
