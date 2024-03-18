ARG BASE_IMAGE=debian:11.9-slim@sha256:a165446a88794db4fec31e35e9441433f9552ae048fb1ed26df352d2b537cb96
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2024-03-18
ARG SENZING_APT_REPOSITORY_URL=https://senzing-production-apt.s3.amazonaws.com/senzingrepo_1.0.1-1_all.deb

LABEL Name="senzing/aptdownloader" \
      Maintainer="support@senzing.com" \
      Version="1.1.7"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apt.

RUN apt update \
 && apt -y install \
    apt-transport-https \
    curl \
    gnupg \
    sudo \
    wget

# Install Senzing repository index.

RUN curl \
    --output /senzingrepo_1.0.1-1_all.deb \
    ${SENZING_APT_REPOSITORY_URL} \
 && apt -y install \
    /senzingrepo_1.0.1-1_all.deb \
 && apt update \
 && rm /senzingrepo_1.0.1-1_all.deb

# Copy files from repository.

COPY ./rootfs /

## Set environment

ENV DEBIAN_FRONTEND noninteractive

# Runtime execution.

VOLUME /download

ENTRYPOINT ["/app/apt-helper.sh"]
CMD ["senzingapi", "senzingdata-v4"]
