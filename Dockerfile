# -*- conf -*-

# Use a minimlist Debian image to get kubectl. We don't have to be
# clever and cleanup, it's a staging area.
FROM debian:stretch-slim

RUN apt-get update && apt-get install -y apt-transport-https curl gnupg2 ca-certificates --no-install-recommends
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
COPY kubernetes.list /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# The actual image we want
FROM alpine:3.8
COPY --from=0 /usr/bin/kubectl /usr/bin/kubectl
