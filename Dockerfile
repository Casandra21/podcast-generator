FROM ubuntu:latest

#for apt-get update is how you load into ubuntu and install is where u install additional packages
RUN apt-get update && apt-get install -y\ 
    python3.10 \
    python3-pip \
    git

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]