FROM docker.io/library/alpine:3.12
LABEL maintainer="Okky Hendriansyah <okky.htf@gmail.com>"
ENV RCLONE_VERSION=v1.53.1
USER root
RUN true \
 && set -xe \
 && apk add --no-cache openssh-client tcpdump busybox-extras bind-tools ca-certificates curl fio libaio-dev iperf iperf3 libcap \
 && chmod u+s /bin/busybox \
 && chmod u+s /bin/busybox-extras \
 && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing hping3 \
 && setcap cap_net_raw+ep /usr/sbin/hping3 \
 && true
RUN true \
 && set -xe \
 && wget -c https://github.com/rclone/rclone/releases/download/${RCLONE_VERSION}/rclone-${RCLONE_VERSION}-linux-amd64.zip \
 && unzip rclone-${RCLONE_VERSION}-linux-amd64.zip \
 && cd rclone-${RCLONE_VERSION}-linux-amd64 \
 && cp rclone /usr/bin/ \
 && chown root:root /usr/bin/rclone \
 && chmod 755 /usr/bin/rclone \
 && rm -rf rclone-${RCLONE_VERSION}-linux-amd64* \
 && true
CMD ["top", "-d", "65535"]
