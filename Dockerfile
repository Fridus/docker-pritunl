FROM pritunl/archlinux

RUN echo "[pritunl]" >> /etc/pacman.conf; echo "Server = http://repo.pritunl.com/stable/pacman" >> /etc/pacman.conf
RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys CF8E292A;\
    pacman-key --keyserver hkp://keyserver.ubuntu.com -r CF8E292A; \
    pacman-key --lsign-key CF8E292A; \
    pacman -Sy; \
    pacman -S --noconfirm pritunl

EXPOSE 1194/udp 1195/udp 9700
CMD pritunl start
