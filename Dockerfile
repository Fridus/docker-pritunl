FROM pritunl/archlinux

RUN echo "[pritunl]" >> /etc/pacman.conf; echo "Server = http://repo.pritunl.com/stable/pacman" >> /etc/pacman.conf
RUN gpg --keyserver hkp://keyserver.ubuntu.com -r 7568D9BB55FF9E5287D586017AE645C0CF8E292A;\
    pacman-key --keyserver hkp://keyserver.ubuntu.com -r CF8E292A; \
    pacman-key --lsign-key 7568D9BB55FF9E5287D586017AE645C0CF8E292A; \
    pacman -Sy; \
    pacman -S --noconfirm pritunl && \
    ln -sf /dev/stdout /var/log/pritunl.log

ADD ./start.sh /start.sh

EXPOSE 1194/udp 1195/udp 9700 443
CMD /start.sh
