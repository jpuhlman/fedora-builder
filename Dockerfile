FROM fedora:30
RUN yum -y update
RUN yum groupinstall -y "Development Tools"
RUN yum install -y sudo vim rpm-build mock screen python
COPY init.sh /
CMD  bash /init.sh
