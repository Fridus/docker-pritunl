FROM centos:7

ENV VERSION=1.16.884.17

RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm && \
    rpm -iUvh ftp://mirror.switch.ch/pool/4/mirror/centos/7.2.1511/cloud/x86_64/openstack-liberty/common/python-netifaces-0.10.4-1.el7.x86_64.rpm && \
    yum -y -q install golang git bzr python2 python-pip net-tools openvpn bridge-utils openssl \
       wget \
       mongodb-server

RUN echo "export GOPATH=/go" >> ~/.bash_profile && \
    source ~/.bash_profile && \
    go get github.com/pritunl/pritunl-dns && \
    go get github.com/pritunl/pritunl-monitor && \
    ln -s /go/bin/pritunl-dns /usr/local/bin/pritunl-dns && \
    ln -s /go/bin/pritunl-monitor /usr/local/bin/pritunl-monitor

RUN wget https://github.com/pritunl/pritunl/archive/$VERSION.tar.gz && \
    tar -xf $VERSION.tar.gz && \
    cd pritunl-$VERSION && \
    python2 setup.py build && \
    pip install -r requirements.txt && \
    mkdir -p /var/lib/pritunl && \
    python2 setup.py install

RUN yum remove -y -q golang git python-pip && \
    cd .. && \
    rm -rf $VERSION.tar.gz && \
    rm -rf pritunl-$VERSION

# Mongo
RUN mkdir -p /data/db

# Debug true
RUN sed -i.bak -e "s,\"debug\".*,\"debug\": \"true\"\,," /etc/pritunl.conf

ADD ./start.sh /start.sh

EXPOSE 1194/udp 1195/udp 9700
CMD /start.sh
