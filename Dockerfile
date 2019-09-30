FROM openjdk:jre-slim

RUN apt-get -qq update --yes \
 && apt-get -qq install --yes --no-install-recommends \
    curl \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

ARG detekt_version=1.0.1
RUN curl -sSLO https://github.com/arturbosch/detekt/releases/download/${detekt_version}/detekt-cli-${detekt_version}-all.jar \
 && mv detekt-cli-${detekt_version}-all.jar /usr/local/bin/detekt-cli.jar
 
COPY detekt.sh /usr/local/bin/detekt