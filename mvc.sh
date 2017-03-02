#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

DOMAIN="localhost"
SUBJ="/C=GB/ST=Kent/L=Crinkley Bottom/O=Example Inc/OU=Org/CN=$DOMAIN"

rsa_cert () {
    algo="rsa"
    keysize=${1:-2048}
    valid_days=${2:-365}

    openssl req \
            -x509 \
            -newkey "$algo:$keysize" \
            -keyout "$DOMAIN-$algo-$keysize.key" \
            -out "$DOMAIN-$algo-$keysize.pem" \
            -days "$valid_days" \
            -subj "$SUBJ" \
            -sha256 \
            -nodes
}

ec_cert () {
    algo="ec"
    curve=${1:-prime256v1}
    valid_days=${2:-365}
    key="$DOMAIN-$algo-$curve.key"
    crt="$DOMAIN-$algo-$curve.pem"

    #openssl ec -genkey -name "$curve" -out $key
    openssl req \
            -x509 \
            -newkey ec:<(openssl ecparam -name $curve) \
            -keyout $key \
            -out $crt \
            -days "$valid_days" \
            -subj "$SUBJ" \
            -sha256 \
            -nodes
}

openssl version

rsa_cert 2048
rsa_cert 4096

ec_cert prime256v1
ec_cert secp384r1
ec_cert secp521r1
