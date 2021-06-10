FROM docker.io/library/alpine:3.13
LABEL maintainer="Okky Hendriansyah <okky.htf@gmail.com>"
ENV RCLONE_VERSION=v1.55.1
ENV SPEEDTEST_VERSION=1.0.0
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
 && cp rclone-${RCLONE_VERSION}-linux-amd64/rclone /usr/bin/ \
 && chown root:root /usr/bin/rclone \
 && chmod 755 /usr/bin/rclone \
 && rm -rf rclone-${RCLONE_VERSION}-linux-amd64* \
 && true
RUN true \
 && set -xe \
 && wget -c https://install.speedtest.net/app/cli/ookla-speedtest-${SPEEDTEST_VERSION}-x86_64-linux.tgz \
 && tar xvvzpf ookla-speedtest-${SPEEDTEST_VERSION}-x86_64-linux.tgz \
 && mv speedtest /usr/bin/speedtest \
 && chmod 755 /usr/bin/speedtest \
 && rm -rf ookla-speedtest-${SPEEDTEST_VERSION}-x86_64-linux.tgz speedtest* \
 && true
CMD ["top", "-d", "65535"]
