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
        php7.0-cli \
        php7.0-opcache \
        php7.0-bcmath \
        php7.0-bz2 \
        php7.0-cli \
        php7.0-common \
        php7.0-curl \
        php7.0-gd \
        php7.0-gmp \
        php7.0-intl \
        php7.0-json \
        php7.0-mbstring \
        php7.0-pgsql \
        php7.0-sqlite3 \
        php7.0-readline \
        php7.0-xml \
        php7.0-zip \
        php7.0-soap \
        php7.0-ldap \
        php7.0-mysql \
        php7.0-mysqli \
        php7.0-redis \
        php7.0-amqp \
        php7.0-ssh2 \
        php7.0-imagick \
        php7.0-sodium && \
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && \
    sudo bash nodesource_setup.sh && \
    sudo apt-get install nodejs -y && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean && \
    sudo mkdir -p /home/jenkins && \
    sudo chown -R 1001:1001 /home/jenkins

USER 1001
