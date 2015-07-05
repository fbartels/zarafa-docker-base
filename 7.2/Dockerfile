FROM ubuntu:trusty
MAINTAINER Felix Bartels "felix@host-consultants.de"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get install -y wget

# Use packages from download.zarafa.com
# Downloading Zarafa packages
RUN mkdir -p /root/packages \
	&& wget --no-check-certificate --quiet \
	https://download.zarafa.com/zarafa/drupal/download_platform.php?platform=beta/7.2/7.2.1-49597/zcp-7.2.1-49597-ubuntu-14.04-x86_64-forhome.tar.gz -O- \
	| tar xz -C /root/packages --strip-components=1

WORKDIR /root/packages

# Packing everything into a local apt repository
RUN apt-ftparchive packages . | gzip -9c > Packages.gz && echo "deb file:/root/packages ./" > /etc/apt/sources.list.d/zarafa.list
