FROM debian:jessie
MAINTAINER Felix Bartels "felix@host-consultants.de"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y wget

# Use packages from download.zarafa.com
# Downloading Zarafa packages
#ENV DOWNLOADURL http://9wd.de/files/zarafa/zcp-7.2.1-51630-ubuntu-14.04-x86_64-supported.tar.gz
ENV DOWNLOADURL http://download.zarafa.com/zarafa/drupal/download_platform.php?platform=final/7.2/7.2.1-51838/zcp-7.2.1-51838-debian-8.0-x86_64-supported.tar.gz
RUN mkdir -p /root/packages \
        && wget --no-check-certificate --quiet \
        $DOWNLOADURL -O- | tar xz -C /root/packages --strip-components=1

WORKDIR /root/packages

# Packing everything into a local apt repository
RUN apt-ftparchive packages . | gzip -9c > Packages.gz && echo "deb file:/root/packages ./" > /etc/apt/sources.list.d/zarafa.list
