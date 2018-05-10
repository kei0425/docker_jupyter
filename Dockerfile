FROM ubuntu:latest

RUN apt-get update && apt-get -y install python3-pip sudo davfs2 && pip3 install --upgrade pip
RUN pip3 install jupyter
ADD sh /root/sh

EXPOSE 80

CMD ['/root/sh/start.sh']