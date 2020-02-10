ARG AZURE_CLI_VERSION=2.0.81
ARG ANSIBLE_VERSION=2.8.5

FROM liksi/ansible:${ANSIBLE_VERSION}-ubuntu18.04
ARG AZURE_CLI_VERSION
ARG ANSIBLE_VERSION
LABEL "maintainer"="liksi <info@liksi.fr>"

RUN pip install --upgrade pip && pip install ansible[azure]==${ANSIBLE_VERSION} && pip install azure-cli==${AZURE_CLI_VERSION}

# Fix an pyOpenSSL package issue... (see https://github.com/erjosito/ansible-azure-lab/issues/5)
RUN pip uninstall -y pyOpenSSL cryptography
RUN pip install pyOpenSSL==19.0.0
RUN pip install cryptography==2.8
