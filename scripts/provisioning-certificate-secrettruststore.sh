#!/bin/bash

namespace=<...>
context=<...>
secretname=<...>
kubectl create secret generic "${secretname}" \
   --namespace=$namespace \
   --context=$contexti \
   --from-file=truststore.jks=truststore.jks \
   --context $contex