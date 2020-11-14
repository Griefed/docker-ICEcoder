FROM lsiobase/alpine:3.12

LABEL maintainer="Griefed <griefed@griefed.de>"

ARG ICECODER_VERSION="8.0beta"

RUN \
        echo "**** install dependencies and build tools and stuff ****" && \
        apk add --no-cache \
        acl \
        alpine-base \
        bzip2 \
        curl \
        fbida-exiftran \
        ffmpeg \
        git \
        gzip \
        imagemagick \
        jq \
        libxml2 \
        libzip \
        libzip-dev \
        libzip-doc \
        libzip-tools \
        memcached \
        php7 \
        php7-apcu \
        php7-bcmath \
        php7-bz2 \
        php7-ctype \
        php7-curl \
        php7-dba \
        php7-dom \
        php7-exif \
        php7-fileinfo \
        php7-fpm \
        php7-ftp \
        php7-gd \
        php7-gettext \
        php7-gmp \
        php7-iconv \
        php7-imagick \
        php7-imap \
        php7-intl \
        php7-json \
        php7-ldap \
        php7-mcrypt \
        php7-memcached \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-pcntl \
        php7-pdo_mysql \
        php7-pdo_odbc \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pear \
        php7-pecl-apcu \
        php7-pecl-imagick \
        php7-pecl-redis \
        php7-pgsql \
        php7-phar \
        php7-posix \
        php7-pspell \
        php7-redis \
        php7-snmp \
        php7-soap \
        php7-sockets \
        php7-sodium \
        php7-sqlite3 \
        php7-ssh2 \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlrpc \
        php7-xsl \
        php7-zip \
        re2c \
        sqlite \
        subversion \
        sudo \
        tar \
        unzip \
        wget \
        xz \
        zip && \
        echo "**** configure php, including symlink ****" && \
        ln -sf \
       	    /usr/bin/php7 \
       	    /usr/bin/php && \
        sed -i \
       	    -e "s#\output_buffering =.*#\output_buffering = \off#g" \
       	    -e "s/post_max_size =.*$/post_max_size = 1560M/" \
       	    -e "s/upload_max_filesize =.*$/upload_max_filesize = 2048M/" \
   	        -e 's#;session.save_path = "/tmp"#session.save_path = "/config/sess"#g' \
       		     /etc/php7/php.ini && \
        echo "**** Misc ****" && \
        echo $ICECODER_VERSION > /version.txt

# Copy local files
COPY root/ /

# Communicate ports and volumes to be used
EXPOSE 8080
VOLUME /config /data /plugins /code