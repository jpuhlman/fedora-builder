FROM fedora:rawhide
RUN yum -y update
RUN yum groupinstall -y "Development Tools"
RUN yum install -y sudo \
    vim \
    rpm-build \
    mock \
    screen \
    python \
    python2 \
    qemu-user-static \
    wget \
    chrpath \
    gcc-g++ \
    hostname \
    rpcgen \
    perl-Thread-Queue \
    glibc-langpack-en \
    python3-langtable
COPY init.sh /
ENV RELEASE_DISTRO fedora
ENV RELEASE_VERSION rawhide
ENV LANG en_US.UTF-8
CMD  bash /init.sh
