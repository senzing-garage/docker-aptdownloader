ARG BASE_IMAGE=debian:13.1-slim@sha256:9b6ccd28f4913155f35e10ecd4437347d86ebce4ecf5853b3568141468faec56
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
  ca-certificates \
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
