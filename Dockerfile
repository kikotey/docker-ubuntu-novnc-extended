FROM kikotey/ubuntu-workspace:latest

LABEL maintainer="jack.crosnierdebellaistre@kikotey.com"

COPY /scripts /home/scripts
COPY /startup /home/startup

RUN mkdir -p ~/solution
RUN cd ~/solution/

RUN echo "deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse" >> ~/solution/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse" >> ~/solution/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse" >> ~/solution/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse" >> ~/solution/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" >> ~/solution/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" >> ~/solution/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse" >> ~/solution/sources.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse " >> ~/solution/sources.list
RUN echo "deb http://archive.canonical.com/ubuntu focal partner" >> ~/solution/sources.list
RUN echo "deb-src http://archive.canonical.com/ubuntu focal partner" >> ~/solution/sources.list

RUN sudo sed -i "s/focal/$(lsb_release -c -s)/" ~/solution/sources.list
RUN sudo rm /etc/apt/sources.list
RUN sudo cp ~/solution/sources.list /etc/apt/sources.list

RUN sudo mv /etc/apt/sources.list.d/* ~/solution

RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip3 --version

COPY requirements.txt /usr/local/lib/web/backend/requirements.txt
COPY xvfb.sh /usr/local/bin/xvfb.sh

RUN pip3 install -r /usr/local/lib/web/backend/requirements.txt
RUN chmod u+x /home/scripts/main-provisioning* \
    && chmod u+x /home/scripts/provisioning* \
    && chmod u+x /home/scripts/desktop-soft-install-script/firefox_developer_edition/install-* \
    && chmod u+x /home/scripts/desktop-soft-install-script/postman/install-* \
    && chmod u+x /usr/local/bin/xvfb.sh

EXPOSE 80
WORKDIR /root
ENV HOME=/home/ubuntu \
    SHELL=/bin/bash

HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://127.0.0.1:6079/api/health
ENTRYPOINT ["/startup.sh"]
