FROM ubuntu:22.04

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN useradd -m salt
#RUN read -s -p "Password: " salt
RUN echo "salt:CloruroSodico" | chpasswd

RUN \
    apt -y update && \
    apt -y upgrade && \
    apt -y install ca-certificates python-is-python3 python3-pip apt-utils curl wget gnupg python3-ipy && \
    pip install cherrypy ws4py PyOpenSSL IPy


RUN \
    curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest/salt-archive-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest jammy main" |  tee /etc/apt/sources.list.d/salt.list

RUN \
    apt-get -y install salt-master && \
    apt -y update && \
    apt-get -y install salt-ssh && \
    apt-get -y install salt-syndic && \
    apt-get -y install salt-cloud && \
    apt-get -y install salt-api && \
    apt autoremove -y 

RUN chmod -R 775 /etc/salt /var/cache/salt /var/log/salt

ADD ./config/master-entrypoint.sh /usr/local/bin/master-entrypoint.sh

EXPOSE 8000 4505 4506

ENTRYPOINT ["/usr/local/bin/master-entrypoint.sh"]