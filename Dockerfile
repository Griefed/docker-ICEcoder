FROM php:alpine

LABEL maintainer="Griefed <griefed@griefed.de>"

RUN apk add --no-cache git      && \
    mkdir /opt/icecoder         && \
    cd /opt/icecoder            && \
    git clone https://github.com/mattpass/ICEcoder.git ./

WORKDIR /opt/icecoder

CMD ["php","-S","0.0.0.0:8080"]
EXPOSE 8080
