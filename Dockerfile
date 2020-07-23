FROM docker.io/library/alpine:3.12
LABEL maintainer="Okky Hendriansyah <okky.htf@gmail.com>"
ENV S3CMD_VERSION=2.1.0
USER root
RUN true \
 && set -xe \
 && apk add --no-cache openssh-client tcpdump busybox-extras bind-tools ca-certificates curl \
 && chmod u+s /bin/busybox \
 && chmod u+s /bin/busybox-extras \
 && apk add --no-cache fio libaio-dev \
 && apk add --no-cache python py-pip py-setuptools libmagic \
 && pip install python-dateutil \
 && mkdir -p /opt \
 && wget https://github.com/s3tools/s3cmd/releases/download/v${S3CMD_VERSION}/s3cmd-${S3CMD_VERSION}.zip \
 && unzip s3cmd-${S3CMD_VERSION}.zip -d /opt/ \
 && rm s3cmd-${S3CMD_VERSION}.zip \
 && ln -s /opt/s3cmd-${S3CMD_VERSION}/s3cmd /usr/local/bin/s3cmd \
 && true
CMD ["top", "-d", "65535"]
