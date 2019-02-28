FROM fedora:latest

MAINTAINER odockal@redhat.com

RUN yum install -y squid

CMD ["/usr/sbin/squid", "-f", "/etc/squid/squid.conf", "-NYCd", "1"]

EXPOSE 3128

