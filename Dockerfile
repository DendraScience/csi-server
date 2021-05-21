FROM debian:stretch

MAINTAINER J. Scott Smith <scott@newleafsolutionsinc.com>

RUN apt-get -qq update \
  && apt-get -y -qq install binutils openssl libc6 libgcc1 libstdc++6 curl zip xdg-utils strace

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

ENTRYPOINT [ "/opt/CampbellSci/LoggerNet/csilgrnet", "--IPv6=true", "--AppDir=/var/opt/CampbellSci/LoggerNet", "--WorkDir=/var/opt/CampbellSci/LoggerNet/sys/bin", "--logFileDir=/var/opt/CampbellSci/LoggerNet/logs" ]
