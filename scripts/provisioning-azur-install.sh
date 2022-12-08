#Then install the Microsoft signing key and add the custom repository.
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
gpg --dearmor |
sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" |
sudo tee /etc/apt/sources.list.d/azure-cli.list

#Finally, install the Azure CLI.
sudo apt-get -y update
sudo apt-get install azure-cli -y
az --version