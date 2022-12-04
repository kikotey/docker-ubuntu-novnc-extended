#/bin/bash
[[ -f ~/.bashrc ]] || cp /root/.bashrc ~/.bashrc
sudo chmod +x ../scripts/*.sh
./../scripts/main-provisioning-lib.sh && ./../scripts/main-provisioning-golang.sh && ./../scripts/main-provisioning-docker.sh
source ~/.bashrc
