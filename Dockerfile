FROM ubuntu:bionic

RUN apt-get update

RUN apt install -y nano

RUN apt install -y libxml2-utils

RUN apt install -y xsltproc

RUN apt install -y apache2


EXPOSE 80

CMD ["/bin/bash"]