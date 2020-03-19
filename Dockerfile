FROM bitnami/jenkins:2
LABEL maintainer "Phizzl <the@phizzl.de>"

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
        python-pip \
        python3-pip && \
    sudo pip install paramiko ansible && \
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
        php7.4-imagick \
        php7.4-sodium \
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
        php7.3-sqlite3 \
        php7.3-readline \
        php7.3-xml \
        php7.3-zip \
        php7.3-soap \
        php7.3-ldap \
        php7.3-mysql \
        php7.3-mysqli \
        php7.3-redis \
        php7.3-amqp \
        php7.3-ssh2 \
        php7.3-imagick \
        php7.3-sodium \
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
        php7.2-sodium \
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
        php7.1-sodium \
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
        php7.0-imagick
        php7.0-sodium && \
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh && \
    sudo bash nodesource_setup.sh && \
    sudo apt-get install nodejs -y && \
    sudo apt-get autoremove -y && \
    sudo apt-get clean && \
    sudo mkdir -p /home/jenkins && \
    sudo chown -R 1001:1001 /home/jenkins
