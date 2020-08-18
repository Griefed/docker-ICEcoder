# ICEcoder-Container
https://github.com/icecoder/ICEcoder in a container!

# Deploy with docker-compose:
```
  icecoder:
    container_name: icecoder
    image: griefed/icecoder
    restart: unless-stopped
    ports:
      - 8080:8080
```

![ICEcoder](https://i.imgur.com/hNjOkVK.png)

Creates a Container which runs [icecoder's](https://github.com/icecoder) [ICEcoder](https://github.com/icecoder/ICEcoder) with, [php:alpine](https://hub.docker.com/_/php) as the base image, as seen on https://icecoder.net/
