FROM kikotey/ubuntu-workspace:latest

LABEL maintainer="jack.crosnierdebellaistre@kikotey.com"

COPY /scripts /home/scripts
COPY /startup /home/startup

RUN apt update \
    && apt install -y python3-pip \
    && pip3 --version

COPY requirements.txt /usr/local/lib/web/backend/requirements.txt
COPY xvfb.sh /usr/local/bin/xvfb.sh

RUN pip3 install -r /usr/local/lib/web/backend/requirements.txt
RUN chmod u+x /home/scripts/main-provisioning* \
    && chmod u+x /home/scripts/provisioning* \
    && chmod u+x /home/scripts/desktop-soft-install-script/firefox_developer_edition/install-* \
    && chmod u+x /home/scripts/desktop-soft-install-script/postman/install-* \
    && chmod u+x /usr/local/bin/xvfb.sh

RUN apt-get -y purge firefox \
    && rm -Rf /root/.mozilla/ \
    && rm /etc/firefox/ \
    && rm -Rf /etc/firefox/ \
    && rm -Rf /usr/lib/firefox \
    && rm -Rf /usr/lib/firefox-addons/

EXPOSE 80
WORKDIR /root
ENV HOME=/home/ubuntu \
    SHELL=/bin/bash

HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://127.0.0.1:6079/api/health
ENTRYPOINT ["/startup.sh"]
