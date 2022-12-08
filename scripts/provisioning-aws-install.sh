curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install -i /usr/bin/aws-cli -b /usr/bin
which aws
ls -l /usr/bin/aws
aws --version