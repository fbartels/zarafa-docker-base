FROM debian:jessie
MAINTAINER Felix Bartels "felix@host-consultants.de"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://docker.host-consultants.de ./" > /etc/apt/sources.list.d/zarafa.list

COPY /scripts/update /bin/
