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
        tar zxvf Python-3.5.5.tgz && \
        cd Python-3.5.5 && \
        ./configure --prefix=/usr/local/opt/Python-3.5.5 && \
        make -j 4 && \
        sudo make altinstall

RUN sudo ln -s /usr/local/opt/Python-3.5.5/bin/pydoc3.5 /usr/bin/pydoc && \
        sudo ln -s /usr/local/opt/Python-3.5.5/bin/python3.5 /usr/bin/python && \
        sudo ln -s /usr/local/opt/Python-3.5.5/bin/python3.5m /usr/bin/pythonm && \
        sudo ln -s /usr/local/opt/Python-3.5.5/bin/pyvenv-3.5 /usr/bin/pyvenv && \
        sudo ln -s /usr/local/opt/Python-3.5.5/bin/pip3.5 /usr/bin/pip

RUN rm -r Python-3.5.5 && \
    rm Python-3.5.5.tgz

CMD ["echo","'No CMD command was set in Dockerfile! Details about CMD command could be found in Dockerfile Guide section in our Docs. Here's the link: http://docs.resin.io/deployment/dockerfile"]