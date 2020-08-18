FROM php:alpine

LABEL maintainer="Griefed <griefed@griefed.de>"

RUN apk update && apk upgrade   && \
    apk add libzip-dev          && \
    docker-php-ext-install zip  && \
    apk add --no-cache git      && \
    apk add php-zip             && \
    apk add php7-zip            && \
    mkdir /opt/icecoder         && \
    cd /opt/icecoder            && \
    git clone https://github.com/mattpass/ICEcoder.git ./

WORKDIR /opt/icecoder

CMD ["php","-S","0.0.0.0:8080"]
EXPOSE 8080
