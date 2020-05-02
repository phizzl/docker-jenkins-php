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
        php7.4-cli \
        php7.4-opcache \
        php7.4-bcmath \
        php7.4-bz2 \
        php7.4-cli \
        php7.4-common \
        php7.4-curl \
        php7.4-gd \
        php7.4-gmp \
        php7.4-intl \
        php7.4-json \
        php7.4-mbstring \
        php7.4-pgsql \
        php7.4-sqlite3 \
        php7.4-readline \
        php7.4-xml \
        php7.4-zip \
        php7.4-soap \
        php7.4-ldap \
        php7.4-mysql \
        php7.4-mysqli \
        php7.4-redis \
        php7.4-amqp \
        php7.4-ssh2 \
        php7.4-imagick && \
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && \
    sudo bash nodesource_setup.sh && \
    sudo apt-get install nodejs -y && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean && \
    sudo mkdir -p /home/jenkins && \
    sudo chown -R 1001:1001 /home/jenkins

USER 1001
