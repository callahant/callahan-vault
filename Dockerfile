FROM phusion/baseimage:latest

RUN apt-get -qq -y update && apt-get install -qq -y unzip memlockd

RUN curl -O https://releases.hashicorp.com/vault/0.5.0/vault_0.5.0_linux_amd64.zip \
  && unzip vault_0.5.0_linux_amd64.zip \
  && mv vault /usr/local/bin/ \
  && rm -f vault_0.5.0_linux_amd64.zip \
  && mkdir /vault

ADD Vault.config /.vaultconfig

EXPOSE 8200

ENTRYPOINT [ "vault" ]
CMD [ "server", "-config", "/.vaultconfig" ]
