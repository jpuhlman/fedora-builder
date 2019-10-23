FROM fedora:30
RUN yum -y update
RUN yum groupinstall -y "Development Tools"
RUN yum install -y sudo vim rpm-build mock screen python python2
COPY init.sh /
CMD  bash /init.sh
