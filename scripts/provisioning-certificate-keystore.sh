 #! /bin/bash
 
if [ $# -eq 0 ]; then
    echo -e "usage: $0 <host>\nexample: $0 abc.com password Jack_CROSNIER-DE-BELLAISTRE_example_name"
    exit -1
fi

keytool -keystore cacerts -genkey -noprompt \
 -alias client \
 -dname "CN=$3, OU=OPS, O=KIKOTEY, L=PARIS, S=FRANCE, C=FR" \
 -storepass $2 \
 -keypass $2
 

KEYTOOL=/usr/bin/keytool
HOST=$1
PORT=443
KEYSTOREFILE=cacerts
KEYSTOREFILE_BKUP=$KEYSTOREFILE.`date '+%Y%m%d%H%M'`.'original'
KEYSTOREPASS=$2

if [ ! -f $KEYSTOREFILE ]; then
    echo -e "You must run this script from the directory jdk/jre/lib/security"
    exit -1
fi

#backup the cacerts file
echo -e "\n\n**** BAKCING UP THE $KEYSTOREFILE TO $KEYSTOREFILE_BKUP ****\n\n"
cp $KEYSTOREFILE $KEYSTOREFILE_BKUP


# get the SSL certificate
echo -e "\n\n**** SAVING THE CERTIFCATE TO ${HOST}.cert ****\n\n"
openssl s_client -connect ${HOST}:${PORT} </dev/null \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ${HOST}.cert

echo -e "\n\n**** USING keytool AT $KEYTOOL ****\n\n"

# create a keystore and import certificate
echo -e "\n\n**** IMPORTING THE CERTIFICATE... ****\n\n"
"$KEYTOOL" -import -noprompt -trustcacerts \
    -alias ${HOST} -file ${HOST}.cert \
    -keystore ${KEYSTOREFILE} -storepass ${KEYSTOREPASS}

echo -e "\n\n**** PRINTING THE CERTIFICATE AFTER IMPORTED ... ****\n\n"
# verify we've got it.
"$KEYTOOL" -list -v -keystore ${KEYSTOREFILE} -storepass ${KEYSTOREPASS} -alias ${HOST} | grep --color=always $HOST