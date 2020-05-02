FROM bitnami/jenkins:latest
LABEL maintainer "Phizzl <the@phizzl.de>"

USER 1000
RUN sudo apt-get update && \
    sudo apt-get install -y \
        rsync \
        zip \
        unzip \
        curl \
        apt-transport-https \
        lsb-release \
        ca-certificates \
        software-properties-common \
        wget \
        python3-pip && \
    sudo pip3 install paramiko ansible && \
    sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list && \
    sudo apt-get update && \
    sudo apt-get install -y \
        php7.1-cli \
        php7.1-opcache \
        php7.1-bcmath \
        php7.1-bz2 \
        php7.1-cli \
        php7.1-common \
        php7.1-curl \
        php7.1-gd \
        php7.1-gmp \
        php7.1-intl \
        php7.1-json \
        php7.1-mbstring \
        php7.1-pgsql \
        php7.1-sqlite3 \
        php7.1-readline \
        php7.1-xml \
        php7.1-zip \
        php7.1-soap \
        php7.1-ldap \
        php7.1-mysql \
        php7.1-mysqli \
        php7.1-redis \
        php7.1-amqp \
        php7.1-ssh2 \
        php7.1-imagick \
        php7.1-sodium && \
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && \
    sudo bash nodesource_setup.sh && \
    sudo apt-get install nodejs -y && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean && \
    sudo mkdir -p /home/jenkins && \
    sudo chown -R 1001:1001 /home/jenkins

USER 1001
