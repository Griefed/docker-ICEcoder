FROM lsiobase/alpine:3.12

LABEL maintainer="Griefed <griefed@griefed.de>"

ARG ICECODER_VERSION=8.0beta

RUN \
        echo "**** install dependencies and build tools and stuff ****" && \
        apk add --no-cache \
        acl \
        alpine-base \
        bzip2 \
        curl \
        git \
        gzip \
        imagemagick \
        libxml2 \
        libzip \
        libzip-dev \
        libzip-doc \
        libzip-tools \
        php7 \
        php7-bz2 \
        php7-curl \
        php7-iconv \
        php7-imagick \
        php7-json \
        php7-pecl-imagick \
        php7-xml \
        php7-xmlreader \
        php7-xmlrpc \
        php7-zip \
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
        echo ${ICECODER_VERSION} > /version.txt

# Copy local files
COPY root/ /

# Communicate ports and volumes to be used
EXPOSE 8080
VOLUME /config /data /plugins
