FROM jetbrains/teamcity-minimal-agent:latest

MAINTAINER Piotr Joński <p.jonski@pojo.pl>

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y git openjdk-8-jdk apt-transport-https ca-certificates && \
    apt-get update && \
    apt-get clean all