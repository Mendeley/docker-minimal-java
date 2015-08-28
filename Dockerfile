FROM progrium/busybox:latest

MAINTAINER Chris Kilding <chris.kilding@mendeley.com>

RUN opkg-install curl ca-certificates

ENV JAVA_HOME /usr/jdk1.8.0_60

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/GeoTrust_Global_CA.crt \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/server-jre-8u60-linux-x64.tar.gz" \
    | gunzip \
    | tar x -C /usr/ \
    && ln -s $JAVA_HOME /usr/java

ENV PATH ${PATH}:${JAVA_HOME}/bin

CMD ["java", "-version"]
