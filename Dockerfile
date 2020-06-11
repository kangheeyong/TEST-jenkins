FROM jenkins/jenkins:lts
MAINTAINER cagojeiger@naver.com

ENV TZ Asia/Seoul 

USER root

RUN apt-get update
RUN apt-get install -y make curl 
RUN curl -fsSL https://get.docker.com/ | sh


