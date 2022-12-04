FROM kikotey/ubuntu-workspace:latest

LABEL maintainer="jack.crosnierdebellaistre@kikotey.com"

COPY /scripts /home/scripts
COPY /startup /home/startup

RUN apt update \
    && apt install -y python3-pip \
    && pip3 --version

RUN chmod u+x /home/scripts/main-provisioning* \
    && chmod u+x /home/scripts/provisioning*
