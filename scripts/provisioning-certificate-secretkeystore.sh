#!/bin/bash

namespace=<...>
context=<...>
secretname=<...>
kubectl create secret generic "${secretname}" \
   --namespace=$namespace \
   --context=$contexti \
   --from-file=keystore.jks=keystore.jks \
   --context $contex