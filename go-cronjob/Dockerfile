FROM golang:1.6-alpine
RUN apk --no-cache add ca-certificates
RUN apk add --no-cache curl bash git

# Install go package manager
RUN go get github.com/tools/godep

RUN wget https://github.com/andyshinn/alpine-pkg-glibc/releases/download/2.22-r5/glibc-2.22-r5.apk
RUN apk --allow-untrusted add glibc-2.22-r5.apk

RUN curl -skL https://github.com/odise/go-cron/releases/download/v0.0.7/go-cron-linux.gz | \
  gunzip -c > /root/go-cron && chmod a+x /root/go-cron

RUN curl -skL https://github.com/rlmcpherson/s3gof3r/releases/download/v0.5.0/gof3r_0.5.0_linux_amd64.tar.gz | \
  gunzip | tar -x -C /tmp -f - && \
  mv /tmp/gof3r_0.5.0_linux_amd64/gof3r /root && \
  chmod +x /root/gof3r && \
  rm -rf /tmp/gof3r_0.5.0_linux_amd64/gof3r

ADD https://curl.haxx.se/ca/cacert.pem /etc/ssl/ca-bundle.pem

# Add scheduler and create jobs entrypoint
ADD scheduler.sh /root/scheduler.sh
RUN chmod a+x /root/scheduler.sh
RUN mkdir /jobs

ADD test.sh /jobs/
RUN chmod a+x /jobs/*

EXPOSE 3000

ENTRYPOINT ["/root/scheduler.sh"]
