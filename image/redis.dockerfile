# This is the base OCI -image to build Docker image to use.
FROM sloopstash/amazon-linux-2:v1.1.1

# Install system packages and dependancies for redis workloads \ database server.
#tcl is the dependancy package for redis server
RUN yum install -y tcl

#Download Redis from Offical Website
RUN wget http://download.redis.io/releases/redis-7.2.1.tar.gz -P /tmp
# Extract redis from Archive
RUN tar xvzf /tmp/redis-7.2.1.tar.gz -C /tmp

#Compile Redis Server
WORKDIR /tmp/redis-7.2.1
RUN set -x \
	$$ make distclean \
	$$ make \
	$$ make install