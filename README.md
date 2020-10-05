# ICEcoder-Container
https://github.com/icecoder/ICEcoder in a container!

![Docker Pulls](https://img.shields.io/docker/pulls/griefed/icecoder?style=flat-square)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/griefed/icecoder?label=Image%20size&sort=date&style=flat-square)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/griefed/icecoder?label=Docker%20build&style=flat-square)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/griefed/icecoder?label=Docker%20build&style=flat-square)
![GitHub Repo stars](https://img.shields.io/github/stars/Griefed/docker-ICEcoder?label=GitHub%20Stars&style=social)
![GitHub forks](https://img.shields.io/github/forks/Griefed/docker-ICEcoder?label=GitHub%20Forks&style=social)

Creates a Container which runs [icecoder's](https://github.com/icecoder) [ICEcoder](https://github.com/icecoder/ICEcoder) with, [php:alpine](https://hub.docker.com/_/php) as the base image, as seen on https://icecoder.net/


# Deploy with docker-compose:
```
  icecoder:
    container_name: icecoder
    image: griefed/icecoder
    restart: unless-stopped
    ports:
      - 8080:8080
```
### Deploy on Rasbperry Pi
Using the Dockerfile, this container can be built and run on a Raspberry Pi, too! I've tested it on a Raspberry Pi 3B+.
Simply put the Dockerfile in a directory called `ICEcoder` in the same directory as your docker-compose.yml, edit your docker-compose.yml:
```
  icecoder:
    container_name: icecoder
    build: ./ICEcoder/
    restart: unless-stopped
    ports:
      - 8080:8080
```
Then build with:
```
docker-compose up -d --build icecoder
```
![ICEcoder](https://i.imgur.com/hNjOkVK.png)
