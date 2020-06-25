# Nginx - Mojolicious - MySQL


## Three dockers

An Nginx proxy is fronting a Mojolicious web service, which in turn fronts a MySQL server. The Mojolicious and MySQL are inaccessible to the public. Only the Nginx is accessible to the outside world.

## Docker network

The docker network is a private network. Only members of the docker network can see each other. The one exception is the Nginx proxy which publishes its port to the outside world.

## Why is the Nginx proxy on port 8088?

Lambert is running this on his laptop, and unfortunately, something else is taking up port 80. Fortunately, docker can re-publish port 80 as a different port number.

## Where is the Ansible?

Unfortunately, Lambert never fully stabilized his Ansible connection to his Raspberry Pi's. Lambert invested a few hours, but it quickly became too much of a time sink.

## Where is the AWS?

Lambert signed up for the free tier only to realize that half of the free features would not be enabled until 24 hours elapsed. Also, you can't construct the AWS network with a free tier. You need a public subnet for the nginx proxy, and private subnet for the web service. A NAT gateway (non-free) is required to connect the two subnets and a VPC (non-free) encloses both subnets.

## Where is the Java?

Lambert has never done Java web development. Better to choose something familiar.

## Why is it Perl?

Because Lambert needed something quick to replace Java. Lambert chose his go-to language of Perl.
