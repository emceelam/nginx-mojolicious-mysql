# Nginx Docker

If you haven't done so already create a docker network for MySQL docker to reside in.

    docker network create hello8081

Let's build the docker image

    docker image build --tag nginx_proxy_hello:latest -f Dockerfile .

Instantiate the docker image, what we call a docker container.

    docker container run --rm --detach \
      --name nginx_proxy_hello \
      --network hello8081 \
      --publish 8088:80 \
      nginx_proxy_hello:latest

Let's test the published port of 8088

    curl localhost:8088

If you want to shell into the docker container

    docker exec --interactive --tty nginx_proxy_hello /bin/sh

While you are shelled into the docker container, you can try curl calls from within the docker network

    # Nginx docker
    curl localhost:80/hello

    # Mojolicious docker
    curl http://hello_app:3000

When you are done, you may stop the docker container

    docker container stop nginx_proxy_hello
