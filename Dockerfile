FROM ubuntu:16.04

MAINTAINER rickshawhobo <rickshawhobo@gmail.com>

ENV LC_ALL C.UTF-8

RUN apt-get update \
    && apt-get install --yes \
    python-pip \
    jq \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    vim \
    maven \
    openjdk-8-jdk \
    openjdk-8-jre \
    npm \
    php7.0 \
    nodejs-legacy \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" \
    && apt-get update \
    && apt-get install --yes docker-ce \
    && systemctl enable docker \
    && curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && pip install --upgrade pip \
    && pip install --upgrade awscli \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer \
    && npm install -g gulp bower \
    && apt-get remove -y --purge python-software-properties software-properties-common \
    && apt-get --purge autoremove -y

WORKDIR /ci

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
