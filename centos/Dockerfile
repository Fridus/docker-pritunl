FROM centos:7

# repos
RUN echo "[pritunl]" >> /etc/yum.repos.d/pritunl.repo; \
  echo "name=Pritunl Repository" >> /etc/yum.repos.d/pritunl.repo; \
  echo "baseurl=https://repo.pritunl.com/stable/yum/centos/7/" >> /etc/yum.repos.d/pritunl.repo; \
  echo "gpgcheck=1" >> /etc/yum.repos.d/pritunl.repo; \
  echo "enabled=1" >> /etc/yum.repos.d/pritunl.repo; \
  echo "[mongodb-org-3.6]" >> /etc/yum.repos.d/mongodb-org-3.6.repo; \
  echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb-org-3.6.repo; \
  echo "baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.6/x86_64/" >> /etc/yum.repos.d/mongodb-org-3.6.repo; \
  echo "gpgcheck=1" >> /etc/yum.repos.d/mongodb-org-3.6.repo; \
  echo "enabled=1" >> /etc/yum.repos.d/mongodb-org-3.6.repo; \
  echo "gpgkey=https://www.mongodb.org/static/pgp/server-3.6.asc" >> /etc/yum.repos.d/mongodb-org-3.6.repo;

# install
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A && \
  gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A > key.tmp; rpm --import key.tmp; rm -f key.tmp && \
  yum -y install pritunl mongodb-org

# Mongo
RUN mkdir -p /data/db

# Debug true
RUN sed -i.bak -e "s,\"debug\".*,\"debug\": \"true\"\,," /etc/pritunl.conf

ADD ./start.sh /start.sh

EXPOSE 1194/udp 1195/udp 9700 443 80
CMD /start.sh
