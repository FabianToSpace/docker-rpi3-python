FROM resin/rpi-raspbian:stretch

# remove several traces of debian python
RUN apt-get purge -y python.*

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

RUN sudo apt-get update && apt-get install -y --no-install-recommends\
        build-essential \
        tk-dev \
        libncurses5-dev \
        libncursesw5-dev \
        libreadline6-dev \
        libdb5.3-dev \
        libgdbm-dev \ 
        libsqlite3-dev \
        libssl-dev \
        libbz2-dev \
        libexpat1-dev \
        liblzma-dev \
        zlib1g-dev \
        wget \
        git

RUN wget https://www.python.org/ftp/python/3.5.5/Python-3.5.5.tgz && \
        tar zxvf Python-3.5.5.tgz

CMD ["echo","'No CMD command was set in Dockerfile! Details about CMD command could be found in Dockerfile Guide section in our Docs. Here's the link: http://docs.resin.io/deployment/dockerfile"]