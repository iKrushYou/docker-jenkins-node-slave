FROM jenkinsci/jnlp-slave:latest

USER root

RUN apt-get update \
        && apt-get install build-essential libssl-dev -y \
        && curl https://raw.githubusercontent.com/creationix/nvm/v0.35.2/install.sh | bash
SHELL ["bash", "-lc"]
RUN nvm --version \
        && nvm install 7 \
        && node -v \
        && npm install yarn -g

ENTRYPOINT ["jenkins-slave"]
