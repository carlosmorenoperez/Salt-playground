FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN \
    apt -y update && \
    apt -y upgrade && \
    apt -y install python3-pip apt-utils curl wget gnupg 

RUN \
    curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest/salt-archive-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest jammy main" |  tee /etc/apt/sources.list.d/salt.list

RUN \
    apt-get -y install salt-minion && \
    mkdir -p /etc/pki/tls/certs && chmod -R 755 /etc/pki/tls/certs 

EXPOSE 4505 4506

ADD ./config/minion_base /etc/salt/minion
ADD ./config/minion-entrypoint.sh /usr/local/bin/minion-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/minion-entrypoint.sh"]