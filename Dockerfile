FROM ubuntu:bionic

RUN apt-get update

RUN apt install -y nano

RUN apt install -y libxml2-utils

RUN apt install -y xsltproc


EXPOSE 2080

CMD ["/bin/bash"]