# Mojolicious Web Service Docker

If you haven't done so already create a docker network for MySQL docker to reside in.

    docker network create hello8081

Build the docker image from the Dockerfile

    docker image build --tag mojo_hello:latest -f Dockerfile .

Let's instantiate from the docker image

    docker container run \
      --rm \
      --detach \
      --name hello_world \
      --network=hello8081 \
      --network-alias hello_app \
      mojo_hello:latest

If you want to shell in, you may.

    docker exec --interactive --tty hello_world /bin/sh

While shelled in, you can use the mysql client.

    mysql -u root -p

When you are done, you can stop the docker instance.

    docker container stop hello_world
