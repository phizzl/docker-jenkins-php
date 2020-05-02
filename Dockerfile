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
        php7.2-cli \
        php7.2-opcache \
        php7.2-bcmath \
        php7.2-bz2 \
        php7.2-cli \
        php7.2-common \
        php7.2-curl \
        php7.2-gd \
        php7.2-gmp \
        php7.2-intl \
        php7.2-json \
        php7.2-mbstring \
        php7.2-pgsql \
        php7.2-sqlite3 \
        php7.2-readline \
        php7.2-xml \
        php7.2-zip \
        php7.2-soap \
        php7.2-ldap \
        php7.2-mysql \
        php7.2-mysqli \
        php7.2-redis \
        php7.2-amqp \
        php7.2-ssh2 \
        php7.2-imagick \
        php7.2-sodium && \
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && \
    sudo bash nodesource_setup.sh && \
    sudo apt-get install nodejs -y && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean && \
    sudo mkdir -p /home/jenkins && \
    sudo chown -R 1001:1001 /home/jenkins

USER 1001
