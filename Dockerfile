FROM jpuhlman/fedora-riscv64:rawhide
RUN dnf -y update
RUN dnf groupinstall -y "Development Tools"
RUN dnf install -y sudo \
    vim \
    rpm-build \
    mock \
    screen \
    python \
    python2 \
    wget \
    chrpath \
    gcc-g++ \
    hostname \
    rpcgen \
    perl-Thread-Queue \
    glibc-langpack-en \
    python3-langtable
COPY init.sh /
ENV RELEASE_DISTRO fedora-riscv64
ENV RELEASE_VERSION rawhide
ENV LANG en_US.UTF-8
CMD  bash /init.sh
