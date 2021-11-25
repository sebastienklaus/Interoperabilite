FROM ubuntu:bionic

RUN apt-get update

RUN apt install nano

RUN apt install libxml2-utils

RUN apt install xsltproc


EXPOSE 2080

CMD ["/bin/bash"]