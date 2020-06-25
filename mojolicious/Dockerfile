FROM centos:8

LABEL maintainer="Lambert Lum"
LABEL description="Mojolicious version of Hello World"

RUN  yum install -y epel-release  perl-App-cpanminus mysql \
  && mkdir /home/hello_world

RUN yum install -y perl-DBD-MySQL
RUN yum install -y perl-Mojolicious

WORKDIR /home/hello_world
COPY files/myapp.pl /home/hello_world

CMD ["prefork"]
ENTRYPOINT ["./myapp.pl"]

EXPOSE 3000/tcp
