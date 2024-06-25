# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.10] - 2024-06-24

### Changed in 1.1.10

- In `Dockerfile`, updated FROM instruction to `debian:11.9-slim@sha256:acc5810124f0929ab44fc7913c0ad936b074cbd3eadf094ac120190862ba36c4`

## [1.1.9] - 2024-05-22

### Changed in 1.1.9

- In `Dockerfile`, 
  - updated FROM instruction to `debian:11.9-slim@sha256:0e75382930ceb533e2f438071307708e79dc86d9b8e433cc6dd1a96872f2651d`
  - updated `senzingrepo_2.0.0-1_all.deb`

## [1.1.8] - 2023-09-29

### Changed in 1.1.8

- In `Dockerfile`, updated FROM instruction to `debian:11.7-slim@sha256:c618be84fc82aa8ba203abbb07218410b0f5b3c7cb6b4e7248fda7785d4f9946`

## [1.1.7] - 2023-04-03

### Changed in 1.1.7

- In `Dockerfile`, updated FROM instruction to `debian:11.6-slim@sha256:7acda01e55b086181a6fa596941503648e423091ca563258e2c1657d140355b1`

## [1.1.6] - 2022-09-29

### Changed in 1.1.6

- In `Dockerfile`, updated FROM instruction to `debian:11.5-slim@sha256:5cf1d98cd0805951484f33b34c1ab25aac7007bb41c8b9901d97e4be3cf3ab04`

## [1.1.5] - 2022-04-07

### Changed in 1.1.5

- Updated Debian version 11.3
- Make `SENZING_APT_REPOSITORY_URL` a docker build arg.
- Updated to `senzingdata-v3`

## [1.1.4] - 2022-01-31

### Changed in 1.1.4

- Updated Debian version 10.10
- Updated to `senzingdata-v2`

## [1.1.3] - 2020-04-24

### Changed in 1.1.3

- Added "-y" to `apt-get` command.

## [1.1.2] - 2020-01-29

### Changed in 1.1.2

- Upgrade Dockerfile to `FROM debian:10.2`

## [1.1.1] - 2019-10-24

### Changed in 1.1.1

- Change package name to senzingdata-v1

## [1.1.0] - 2019-09-01

### Added in 1.1.0

- Added `senzingdata` package.

## [1.0.0] - 2019-08-31

### Added in 1.0.0

- Basic wrapper over **yumdownloader**
