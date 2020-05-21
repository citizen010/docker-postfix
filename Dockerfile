FROM ubuntu:18.04
MAINTAINER Citizen010

ENV LAST_MODIFIED "2002-05-21"

RUN apt-get update
RUN apt-get install postfix rsyslog nano -y
RUN apt-get upgrade bash -y

ADD conf/main.cf /
ADD conf/startservices.sh /
RUN chmod +x startservices.sh

ENTRYPOINT ["/startservices.sh"]
