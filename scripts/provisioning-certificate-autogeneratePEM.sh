#!/bin/bash

openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 \
 -dname "CN=example.mq, OU=ID, O=KIKOTEY, L=MARTINIQUE, S=Hants, C=MQ" \
-keyout key.pem -out cert.pem