#!/usr/bin/env bash

# The script will generate Certificate Authority keys and sign certificate and will import it to JKS without any prompts
# to use on the server side keystore (server.keystore.jks) and client side truststore (client.keystore.jks)    

# You can add more info to the dn by updating the -dname parameter
#  -dname "CN=$CERTIFICATE_CN, OU=example, O=example, L=example, S=example, C=US" \

# To inpspect jks, key and certificate:
# keytool -v -list -keystore server.keystore.jks
# openssl x509 -noout -text -in cert-signed

# example CERTIFICATE_CN=localhost
CERTIFICATE_CN=localhost
PASSWORD=autogenerate

function show_usage {
  cat << EOF
  usage: auto-generate-jks.sh [options ..]
  --cert_cn Certificate Common Name.  Default: localhost
  --pass Password to use for JKS and private key. Default: changeme
EOF
}

while [[ "$#" -gt 0 ]]; do
  case "$1" in
  --cert_cn) CERTIFICATE_CN=$2; shift 2;;
  --pass) PASSWORD=$2; shift 2;;
  --help) show_usage
          exit 0
  esac
done


# Generate jks keystore with a private key
keytool -genkey -noprompt \
  -alias server-key \
  -dname "CN=$CERTIFICATE_CN" \
  -keystore server.keystore.jks \
  -storepass "$PASSWORD" \
  -keypass "$PASSWORD" \
  -validity 365 \
  -deststoretype pkcs12 \
  -keyalg RSA -genkey

## Generate private key and cert for Certificate Authority
## The req command primarily creates and processes certificate requests in PKCS#10 format.
## It can additionally create self signed certificates for use as root CAs for example.
openssl req -new -x509 -keyout ca-key -out ca-cert -days 365 -passout pass:"$PASSWORD" -subj "/CN=$CERTIFICATE_CN"

## Import Certificate authority certificate into server jks and create certstore jks for client
keytool -keystore server.truststore.jks -alias CARoot -import -file ca-cert -keypass "$PASSWORD" -storepass "$PASSWORD" -noprompt
keytool -keystore client.truststore.jks -alias CARoot -import -file ca-cert -keypass "$PASSWORD" -storepass "$PASSWORD" -noprompt

# Generate a certificate request
keytool -keystore server.keystore.jks -alias server-key -certreq -file cert-file -keypass "$PASSWORD" -storepass "$PASSWORD" -noprompt

# Signed a certificagte request with previously created Certificate Authority
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file -out cert-signed -days 365 -CAcreateserial -passin pass:"$PASSWORD"

# Importing signed certificate
keytool -keystore server.keystore.jks -alias CARoot -import -file ca-cert -storepass "$PASSWORD" -noprompt  -keypass "$PASSWORD"
keytool -keystore server.keystore.jks -alias server-key -import -file cert-signed -storepass "$PASSWORD" -noprompt  -keypass "$PASSWORD"