FROM docker.io/library/alpine:3.10
LABEL maintainer="Okky Hendriansyah <okky.htf@gmail.com>"
USER root
RUN true \
 && set -xe \
 && apk add --no-cache openssh-client tcpdump busybox-extras bind-tools ca-certificates curl \
 && chmod u+s /bin/busybox \
 && chmod u+s /bin/busybox-extras \
 && apk --no-cache add make alpine-sdk zlib-dev libaio-dev linux-headers coreutils libaio \
 && git clone https://github.com/axboe/fio \
 && cd fio \
 && ./configure \
 && make -j`nproc` \
 && make install \
 && cd .. \
 && rm -rf fio \
 && apk del --no-cache make alpine-sdk zlib-dev libaio-dev linux-headers coreutils \
 && apk add --no-cache python py-pip py-setuptools libmagic \
 && mkdir -p /opt \
 && wget https://github.com/s3tools/s3cmd/releases/download/v2.0.2/s3cmd-2.0.2.zip \
 && unzip s3cmd-2.0.2.zip -d /opt/ \
 && rm s3cmd-2.0.2.zip \
 && ln -s /opt/s3cmd/s3cmd-2.0.2/s3cmd /usr/local/bin/s3cmd \
 && true
CMD ["top", "-d", "65535"]
