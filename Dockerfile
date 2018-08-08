FROM docker.io/library/alpine:3.8
LABEL maintainer="Okky Hendriansyah <okky.htf@gmail.com>"
USER root
RUN true \
 && apk add --no-cache openssh-client tcpdump busybox-extras \
 && chmod u+s /bin/busybox \
 && chmod u+s /bin/busybox-extras \
 && true
CMD ["top", "-d", "65535"]
