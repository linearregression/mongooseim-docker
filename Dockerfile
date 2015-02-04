FROM ubuntu:14.04
MAINTAINER Pawel Pikula <pawel.pikula@erlang-solutions.com>

ENV HOME /opt/mongooseim
ENV MONGOOSEIM_VERSION 1.5
ENV DEBIAN_FRONTEND noninteractive

# add esl packages
RUN apt-get install -y wget
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc
RUN apt-key add erlang_solutions.asc


RUN apt-get -q update
RUN apt-get install -y erlang
RUN apt-get install -y mongooseim

EXPOSE 5222 5280 5269 
#VOLUME ["/usr/lib/mongooseim/", "/usr/lib/mongooseim/"]

CMD ["live"]
ENTRYPOINT ["/usr/lib/mongooseim/bin/mongooseimctl"]

