# MySQL docker

If you haven't done so already create a docker network for MySQL docker to reside in.

    docker network create hello8081

Always start with a fresh data volume for MySQL

    docker volume rm hello_volume
    docker volume create hello_volume

Instantiate the MySQL docker image

    docker container run --rm --detach \
      --name mysql-server \
      --network-alias hello_mysql \
      --network=hello8081 \
      --mount type=bind,source=$PWD/files/docker-entrypoint-initdb.d/,target=/docker-entrypoint-initdb.d/ \
      --mount type=volume,source=hello_volume,target=/var/lib/mysql \
      --env MYSQL_ROOT_PASSWORD=foobar \
      --env MYSQL_ROOT_HOST=% \
      --env MYSQL_DATABASE=hello_database \
      mysql/mysql-server:5.7 --bind-address=0.0.0.0

The MySQL docker will take several seconds to initialize. Any attempt to connect to MySQL will fail. Please, wait for the logs to indicate that MySQL is ready for connections.

    docker logs --follow mysql-server

If you want to shell into the MySQL docker

    docker exec --interactive --tty mysql-server /bin/sh

When you are done, you may stop the MySQL docker.

    docker container stop mysql-server


## Why is Lambert using an older MySQL?

Because the MySQL server 8.x is using an updated TLS that is breaking my MySQL connection code. Lambert expended two or three hours to figure out the TLS, and failed. Thus Lambert chose MySQL 5.7, an oldie, but goodie.
