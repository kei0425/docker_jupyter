FROM ubuntu:latest

RUN apt-get update && apt-get -y install python3-pip libcurl4-openssl-dev && pip3 install --upgrade pip
RUN pip3 install notebook==5.6.0 jupyter_nbextensions_configurator
##RUN apt-get -y install davfs2 
RUN mkdir /root/.jupyter
ADD sh /root/sh
RUN jupyter nbextensions_configurator enable --user
RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master
RUN jupyter contrib nbextension install --user

EXPOSE 80

CMD ["/root/sh/start.sh"]
