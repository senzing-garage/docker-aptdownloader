#!/usr/bin/env bash

apt update
apt-get -y install --download-only -o Dir::Cache=/tmp  -o Dir::Cache::archives=/download $@
