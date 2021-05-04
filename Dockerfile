FROM debian:stretch

MAINTAINER J. Scott Smith <scott@newleafsolutionsinc.com>

RUN apt-get -qq update \
  && apt-get -y -qq install binutils curl openssl

RUN groupadd --gid 2000 loggernet \
  && useradd --uid 2000 --gid 2000 -r -d /var/opt/CampbellSci/LoggerNet loggernet

# Create configuration directory
RUN mkdir -p /etc/opt/CampbellSci
# Create binary executable directory
RUN mkdir -p /opt/CampbellSci/LoggerNet
# Create working directory
RUN mkdir -p /var/opt/CampbellSci/LoggerNet

USER loggernet
EXPOSE 6789

ENTRYPOINT [ "/opt/CampbellSci/LoggerNet/csilgrnet", "--IPv6=true", "--AppDir=/opt/CampbellSci/LoggerNet", "--WorkDir=/var/opt/CampbellSci/LoggerNet", "--logFileDir=/var/opt/CampbellSci/LoggerNet/logs" ]
