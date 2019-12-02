FROM bitnami/jenkins:2
LABEL maintainer "Phizzl <the@phizzl.de>"

RUN sudo apt-get update && \
    sudo apt-get install -y rsync curl apt-transport-https lsb-release ca-certificates software-properties-common wget python-pip && \
    sudo pip install ansible && \
    sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list && \
    sudo apt-get update && \
    sudo apt-get install -y \
        php7.3-cli \
        php7.3-opcache \
        php7.3-bcmath \
        php7.3-bz2 \
        php7.3-cli \
        php7.3-common \
        php7.3-curl \
        php7.3-gd \
        php7.3-gmp \
        php7.3-intl \
        php7.3-json \
        php7.3-mbstring \
        php7.3-pgsql \
        php7.3-readline \
        php7.3-xml \
        php7.3-zip \
        php7.3-soap \
        php7.3-ldap \
        php7.3-mysql \
        php7.3-redis \
        php7.3-amqp && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean && \
    sudo mkdir -p /home/jenkins && \
    sudo chown -R 1001:1001 /home/jenkins
