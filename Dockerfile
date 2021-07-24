FROM debian:buster-slim
LABEL Description="Tilemaker" Version="1.4.0"

# install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates curl unzip osmctools jq git

WORKDIR /

RUN curl -Lo tilemaker.zip https://github.com/systemed/tilemaker/releases/download/v2.0.0/tilemaker-ubuntu-16.04.zip && \
    unzip tilemaker.zip && \
    chmod +x /build/tilemaker && \
    mv /build/tilemaker /usr/bin/tilemaker

RUN jq '.settings.compress="none"' /resources/config-openmaptiles.json >/tmp/bak && \
    mv /tmp/bak /resources/config-openmaptiles.json

ENTRYPOINT ["tilemaker"]
