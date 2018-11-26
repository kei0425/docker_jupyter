FROM ubuntu:latest

RUN apt-get update && apt-get -y install python3-pip libcurl4-openssl-dev && pip3 install --upgrade pip
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
##RUN apt-get -y install davfs2 
RUN mkdir /root/.jupyter
ADD sh /root/sh
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable codefolding/main
RUN jupyter contrib nbextensions migrate

EXPOSE 80

CMD ["/root/sh/start.sh"]
