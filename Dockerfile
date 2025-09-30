ARG BASE_IMAGE=debian:13.1-slim@sha256:1caf1c703c8f7e15dcf2e7769b35000c764e6f50e4d7401c355fb0248f3ddfdb
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2024-06-24
ARG SENZING_APT_REPOSITORY_URL=https://senzing-production-apt.s3.amazonaws.com/senzingrepo_2.0.1-1_all.deb

LABEL Name="senzing/aptdownloader" \
  Maintainer="support@senzing.com" \
  Version="1.1.10"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apt-get.

RUN apt-get update \
  && apt-get -y --no-install-recommends install \
  apt-transport-https \
  curl \
  gnupg \
  wget

# Install Senzing repository index.

RUN curl --output /install.deb ${SENZING_APT_REPOSITORY_URL} \
  && apt-get -y --no-install-recommends install /install.deb \
  && apt-get update \
  && rm /install.deb

# Copy files from repository.

COPY ./rootfs /

USER 1001

## Set environment

ENV DEBIAN_FRONTEND=noninteractive

# Runtime execution.

VOLUME /download

ENTRYPOINT ["/app/apt-helper.sh"]
CMD ["senzingapi"]
