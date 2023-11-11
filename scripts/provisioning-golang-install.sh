#/bin/bash
[[ -f ~/.bashrc ]] || touch ~/.bashrc

wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
tar -xzf go1.19.3.linux-amd64.tar.gz -C .
cp  go/bin/go /bin/go
echo "export PATH=$PATH:~/go/bin" >> /etc/profile
echo "export GOPATH=/go" >> ~/.bashrc
echo "export GOROOT=/home/scripts/go" >> ~/.bashrc
echo "export GOPATH=/go" >> /root/.bashrc
echo "export GOROOT=/home/scripts/go" >> /root/.bashrc
source /etc/profile
source ~/.bashrc
source /root/.bashrc

export GOPATH=/go
export GOROOT=/home/scripts/go

#go version
