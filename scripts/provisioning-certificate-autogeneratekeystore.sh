#!/bin/bash

keytool -genkey -noprompt \
 -alias alias1 \
 -dname "CN=example.mq, OU=ID, O=KIKOTEY, L=MARTINIQUE, S=Hants, C=MQ" \
 -keystore keystore \
 -storepass password \
 -keypass password