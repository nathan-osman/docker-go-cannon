FROM ubuntu:14.04
MAINTAINER Nathan Osman <nathan@quickmediasolutions.com>

# Add the compressed tarball from the GitHub release page
ADD https://github.com/hectane/hectane/releases/download/v0.3.0/hectane-v0.3.0-linux-amd64.tar.gz /root/

# Extract the archive
RUN \
    cd /root && \
    tar xf hectane-v0.3.0-linux-amd64.tar.gz && \
    rm hectane-v0.3.0-linux-amd64.tar.gz

# Set a few configuration defaults
ENV DEBUG=0 \
        DIRECTORY=/data \
        DISABLE_SSL_VERIFICATION=0 \
        LOGFILE=/var/log/hectane.log

# Specify the executable to run
CMD /root/hectane \
        -tls-cert="$TLS_CERT" \
        -tls-key="$TLS_KEY" \
        -username="$USERNAME" \
        -password="$PASSWORD" \
        -directory="$DIRECTORY" \
        -disable-ssl-verification="$DISABLE_SSL_VERIFICATION"

# Expose the port with the HTTP API
EXPOSE 8025
