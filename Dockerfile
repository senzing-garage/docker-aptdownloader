ARG BASE_IMAGE=debian:11.3-slim@sha256:06a93cbdd49a265795ef7b24fe374fee670148a7973190fb798e43b3cf7c5d0f
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-05-16
ARG SENZING_APT_REPOSITORY_URL=https://senzing-production-apt.s3.amazonaws.com/senzingrepo_1.0.0-1_amd64.deb

LABEL Name="senzing/aptdownloader" \
      Maintainer="support@senzing.com" \
      Version="1.1.5"

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
    --output /senzingrepo_1.0.0-1_amd64.deb \
    ${SENZING_APT_REPOSITORY_URL} \
 && apt -y install \
    /senzingrepo_1.0.0-1_amd64.deb \
 && apt update \
 && rm /senzingrepo_1.0.0-1_amd64.deb

# Copy files from repository.

COPY ./rootfs /

## Set environment

ENV DEBIAN_FRONTEND noninteractive

# Runtime execution.

VOLUME /download

ENTRYPOINT ["/app/apt-helper.sh"]
CMD ["senzingapi", "senzingdata-v3"]
