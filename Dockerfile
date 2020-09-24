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
 && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing hping3 \
 && true
CMD ["top", "-d", "65535"]
