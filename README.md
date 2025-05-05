# docker-aptdownloader

If you are beginning your journey with [Senzing],
please start with [Senzing Quick Start guides].

You are in the [Senzing Garage] where projects are "tinkered" on.
Although this GitHub repository may help you understand an approach to using Senzing,
it's not considered to be "production ready" and is not considered to be part of the Senzing product.
Heck, it may not even be appropriate for your application of Senzing!

## Synopsis

A Docker wrapper over the `apt-get` command
tuned to download the `.deb` file.

## Overview

A thin wrapper over `apt-get install --download-only`.

The Docker container downloads the latest
`senzingapi-M.m.p-xxxxx.x86_64.deb` and
`senzingdata-v3-M.m.p-xxxxx.x86_64.deb` files.

### Contents

1. [Preamble]
   1. [Legend]
1. [Related artifacts]
1. [Expectations]
1. [Demonstrate using Docker]
   1. [Prerequisites for Docker]
   1. [Run Docker container]
1. [Develop]
   1. [Prerequisites for development]
   1. [Clone repository]
   1. [Build Docker image]
1. [Examples]
   1. [Examples of Docker]
1. [Advanced]
   1. [Configuration]
1. [Errors]
1. [References]

## Preamble

At [Senzing],
we strive to create GitHub documentation in a "[don't make me think]" style.
For the most part, instructions are copy and paste.
Whenever thinking is needed, it's marked with a "thinking" icon :thinking:.
Whenever customization is needed, it's marked with a "pencil" icon :pencil2:.
If the instructions are not clear, please let us know by opening a new
[Documentation issue] describing where we can improve. Now on with the show...

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps there are some choices to be made.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

## Related artifacts

1. [DockerHub]

## Expectations

- **Space:** This repository and demonstration require 6 GB free disk space.
- **Time:** Budget 30 minutes to get the demonstration up-and-running, depending on CPU and network speeds.
- **Background knowledge:** This repository assumes a working knowledge of:
  - [Docker]

## Demonstrate using Docker

### Prerequisites for Docker

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. The following software programs need to be installed:
   1. [Docker]

### Run Docker container

1. :pencil2: Set environment variables.
   Example:

   ```console
   export SENZING_DEB_DIR=~/Downloads
   ```

1. Run Docker container.
   Example:

   ```console
   sudo docker run \
     --rm \
     --volume ${SENZING_DEB_DIR}:/download \
     senzing/aptdownloader
   ```

1. For more examples of use, see [Examples of Docker].

## Develop

The following instructions are used when modifying and building the Docker image.

### Prerequisites for development

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. The following software programs need to be installed:
   1. [git]
   1. [make]
   1. [Docker]

### Clone repository

For more information on environment variables,
see [Environment Variables].

1. Set these environment variable values:

   ```console
   export GIT_ACCOUNT=senzing
   export GIT_REPOSITORY=docker-aptdownloader
   export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
   export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
   ```

1. Using the environment variables values just set, follow steps in [clone-repository] to install the Git repository.

### Build Docker image

1. **Option #1:** Using `docker` command and GitHub.

   ```console
   sudo docker build \
     --tag senzing/aptdownloader \
     https://github.com/senzing-garage/docker-aptdownloader.git#main
   ```

1. **Option #2:** Using `docker` command and local repository.

   ```console
   cd ${GIT_REPOSITORY_DIR}
   sudo docker build --tag senzing/aptdownloader .
   ```

1. **Option #3:** Using `make` command.

   ```console
   cd ${GIT_REPOSITORY_DIR}
   sudo make docker-build
   ```

   Note: `sudo make docker-build-development-cache` can be used to create cached Docker layers.

## Examples

### Examples of Docker

The following examples require initialization described in
[Demonstrate using Docker].

## Advanced

### Configuration

Configuration values specified by environment variable or command line parameter.

- **[SENZING_DEB_DIR]**

## Errors

1. See [docs/errors.md].

## References

[Advanced]: #advanced
[Build Docker image]: #build-docker-image
[Clone repository]: #clone-repository
[clone-repository]: https://github.com/senzing-garage/knowledge-base/blob/main/HOWTO/clone-repository.md
[Configuration]: #configuration
[Demonstrate using Docker]: #demonstrate-using-docker
[Demonstrate using Docker]: #demonstrate-using-docker
[Develop]: #develop
[Docker]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/docker.md
[DockerHub]: https://hub.docker.com/r/senzing/aptdownloader
[docs/errors.md]: docs/errors.md
[Documentation issue]: https://github.com/senzing-garage/docker-aptdownloader/issues/new?template=documentation_request.md
[don't make me think]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/dont-make-me-think.md
[Environment Variables]: https://github.com/senzing-garage/knowledge-base/blob/main/lists/environment-variables.md
[Errors]: #errors
[Examples of Docker]: #examples-of-docker
[Examples of Docker]: #examples-of-docker
[Examples]: #examples
[Expectations]: #expectations
[git]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/git.md
[Legend]: #legend
[make]: https://github.com/senzing-garage/knowledge-base/blob/main/WHATIS/make.md
[Preamble]: #preamble
[Prerequisites for development]: #prerequisites-for-development
[Prerequisites for Docker]: #prerequisites-for-docker
[References]: #references
[Related artifacts]: #related-artifacts
[Run Docker container]: #run-docker-container
[Senzing Garage]: https://github.com/senzing-garage
[Senzing Quick Start guides]: https://docs.senzing.com/quickstart/
[SENZING_DEB_DIR]: https://github.com/senzing-garage/knowledge-base/blob/main/lists/environment-variables.md#senzing_deb_dir
[Senzing]: https://senzing.com/
