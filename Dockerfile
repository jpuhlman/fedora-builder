FROM fedora:31
RUN yum -y update
RUN yum groupinstall -y "Development Tools"
RUN yum install -y sudo vim rpm-build mock screen python python2 docker wget
COPY init.sh /
ENV RELEASE_DISTRO fedora
ENV RELEASE_VERSION 31
CMD  bash /init.sh
