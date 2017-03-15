FROM ubuntu:16.04
MAINTAINER JCharante (contactme@jcharante.com)

# Update OS
#RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list


# Swap Stuff
#COPY install_swap.sh /app/
#RUN chmod +x /app/install_swap.sh
#RUN /app/install_swap.sh

# Installing Python
RUN apt-get update
RUN apt-get install -y \
	software-properties-common \
	python-software-properties
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install -y \
	python3.6 \
	python3.6-dev \
	python3-pip

# Installing Python Dependencies
COPY requirements.txt /app/
RUN python3.6 -m pip install --upgrade pip
RUN python3.6 -m pip install -r /app/requirements.txt

# Copying App Files
COPY . /app
ENV HOME /app
WORKDIR /app

# Ports
EXPOSE 80

ENTRYPOINT python3.6 server.py
