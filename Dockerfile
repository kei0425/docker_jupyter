FROM ubuntu:latest

RUN apt-get update && apt-get -y install python3-pip sudo && pip3 install --upgrade pip
RUN pip3 install jupyter
##RUN apt-get -y install davfs2 
ADD sh /root/sh

EXPOSE 80

CMD ['/root/sh/start.sh']
