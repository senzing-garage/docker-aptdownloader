ARG BASE_IMAGE=debian:11.9-slim@sha256:0e75382930ceb533e2f438071307708e79dc86d9b8e433cc6dd1a96872f2651d
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2024-05-22
ARG SENZING_APT_REPOSITORY_URL=https://senzing-production-apt.s3.amazonaws.com/senzingrepo_2.0.0-1_all.deb

LABEL Name="senzing/aptdownloader" \
  Maintainer="support@senzing.com" \
  Version="1.1.9"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apt-get.

RUN apt-get update \
  && apt-get -y install \
  apt-transport-https \
  curl \
  gnupg \
  wget

# Install Senzing repository index.

RUN curl --output /install.deb ${SENZING_APT_REPOSITORY_URL} \
  && apt-get -y install /install.deb \
  && apt-get update \
  && rm /install.deb

# Copy files from repository.

COPY ./rootfs /

USER 1001

## Set environment

ENV DEBIAN_FRONTEND noninteractive

# Runtime execution.

VOLUME /download

ENTRYPOINT ["/app/apt-helper.sh"]
CMD ["senzingapi"]
