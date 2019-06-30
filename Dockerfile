FROM docker.io/library/alpine:edge
LABEL maintainer="Okky Hendriansyah <okky.htf@gmail.com>"
USER root
RUN true \
 && set -xe \
 && apk --no-cache add openssh-client tcpdump busybox-extras bind-tools curl s3cmd \
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
 && apk --no-cache del make alpine-sdk zlib-dev libaio-dev linux-headers coreutils \
 && true
CMD ["top", "-d", "65535"]
