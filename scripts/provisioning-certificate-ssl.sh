#! /bin/bash

if [ $# -eq 0 ]; then
    echo -e "usage: $0 <host>\nexample: $0 abc.com"
    exit -1
fi
KEYTOOL=/usr/bin/keytool
HOST=$1
PORT=443
KEYSTOREFILE=cacerts
KEYSTOREFILE_BKUP=$KEYSTOREFILE.`date '+%Y%m%d%H%M'`.'original'

echo -e "\n\n**** USING keytool AT $KEYTOOL ****\n\n"

# create a keystore and import certificate
echo -e "\n\n**** IMPORTING THE CERTIFICATE... ****\n\n"
"$KEYTOOL" -import -noprompt -trustcacerts \
    -alias ${HOST} -file ${HOST}.cert \
    -keystore ${KEYSTOREFILE} -storepass ${KEYSTOREPASS}

echo -e "\n\n**** PRINTING THE CERTIFICATE AFTER IMPORTED ... ****\n\n"
# verify we've got it.
"$KEYTOOL" -list -v -keystore ${KEYSTOREFILE} -storepass ${KEYSTOREPASS} -alias ${HOST} | grep --color=always $HOST