#!/bin/sh
set -e

# docker installation
#
# See https://docs.docker.com/engine/install/ for the installation steps.
#
# This script is meant for quick & easy install via:
#   $ curl -fsSL https://get.docker.com -o get-docker.sh
#   $ sh get-docker.sh

if [ ! "$(command -v docker)" ]
then
    printf "Installing docker engine...\n"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh --version "${docker_version}"
else
    echo "docker is already installed.!"
fi

# post install
usermod -aG docker ubuntu