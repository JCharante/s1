FROM ubuntu:16.04

# Update OS
#RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install -y python3.6 python3.6-dev python3-pip


COPY . /app
ENV HOME /app
WORKDIR /app

RUN python3.6 -m pip install -r requirements.txt
EXPOSE 80

CMD python3.6 server.py
