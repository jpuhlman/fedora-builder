FROM fedora:32
# Update seems to be returning 132
RUN yum -y update || true
RUN yum groupinstall -y "Development Tools"
RUN yum install -y sudo vim rpm-build mock screen python python2 docker wget
COPY init.sh /
ENV RELEASE_DISTRO fedora
ENV RELEASE_VERSION 32
CMD  bash /init.sh
