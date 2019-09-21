FROM fedora:30
RUN yum -y update
RUN yum install -y sudo vim rpm-build mock screen make git rpm python
COPY init.sh /
CMD  bash /init.sh
