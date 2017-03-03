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
    base="$DOMAIN-$algo-$keysize"
    key_pem="$base.key"
    crt_pem="$base.pem"
    crt_der="$base.der"

    openssl req \
            -x509 \
            -newkey "$algo:$keysize" \
            -keyout "$key_pem" \
            -out "$crt_pem" \
            -days "$valid_days" \
            -subj "$SUBJ" \
            -sha256 \
            -nodes
    openssl x509 -in "$crt_pem" -outform der -out "$crt_der"
}

ec_cert () {
    algo="ec"
    curve=${1:-prime256v1}
    valid_days=${2:-365}
    base="$DOMAIN-$algo-$curve"
    key_pem="$base.key"
    crt_pem="$base.pem"
    crt_der="$base.der"
    #openssl ec -genkey -name "$curve" -out $key
    openssl req \
            -x509 \
            -newkey ec:<(openssl ecparam -name $curve) \
            -keyout "$key_pem" \
            -out "$crt_pem" \
            -days "$valid_days" \
            -subj "$SUBJ" \
            -sha256 \
            -nodes
    openssl x509 -in "$crt_pem" -outform der -out "$crt_der"
}

openssl version

rsa_cert 2048
rsa_cert 4096

ec_cert prime256v1
ec_cert secp384r1
ec_cert secp521r1
