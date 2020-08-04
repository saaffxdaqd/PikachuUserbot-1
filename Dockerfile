
FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

RUN apt-get install -y\
    sudo \ 
    coreutils \
    bash \
    nodejs \
    bzip2 \
    curl \
    figlet \
    gcc \
    g++ \
    git \
    aria2 \
    axel \
    util-linux \
    libevent-dev \
    libjpeg-dev \
    libffi-dev \
    libpq-dev \
    libwebp-dev \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    musl \
    neofetch \
    libcurl4-openssl-dev \
    postgresql \
    postgresql-client \
    postgresql-server-dev-all \
    #chromedriver \
    openssl \
    pv \
    jq \
    wget \
    python3 \
    python3-dev \
    python3-pip \
    libreadline-dev \
    sqlite \
    ffmpeg \
    libsqlite3-dev \
    zlib1g-dev \
    recoverjpeg \
    zip \
    megatools 




RUN pip3 install --upgrade pip setuptools 
RUN pip3 install --upgrade pip install wheel 
RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 
RUN if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi 
RUN rm -r /root/.cache

RUN git clone https://github.com/ItzSjDude/PikachuUserbot ./root/userbot
RUN mkdir /root/userbot/bin/
WORKDIR /root/userbot/
RUN pip3 install -r requirements.txt
CMD ["python3","-m","userbot"]

