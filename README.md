# Minimum Viable Certificate

I was curious how small an SSL certificate could be made, and still be useful.

```
$ ./mvc.sh 
OpenSSL 1.0.2g  1 Mar 2016
Generating a 2048 bit RSA private key
..........................................................................................................+++
..........+++
writing new private key to 'localhost-rsa-2048.key'
-----
Generating a 4096 bit RSA private key
...........++
............................................................................................................................................................................................................++
writing new private key to 'localhost-rsa-4096.key'
-----
Generating a 256 bit EC private key
writing new private key to 'localhost-ec-prime256v1.key'
-----
Generating a 384 bit EC private key
writing new private key to 'localhost-ec-secp384r1.key'
-----
Generating a 521 bit EC private key
writing new private key to 'localhost-ec-secp521r1.key'
-----
```

```
$ ls -og localhost-*
-rw-r--r-- 1  551 Mar  3 00:15 localhost-ec-prime256v1.der
-rw-r--r-- 1  241 Mar  3 00:15 localhost-ec-prime256v1.key
-rw-r--r-- 1  802 Mar  3 00:15 localhost-ec-prime256v1.pem
-rw-r--r-- 1  612 Mar  3 00:15 localhost-ec-secp384r1.der
-rw-r--r-- 1  306 Mar  3 00:15 localhost-ec-secp384r1.key
-rw-r--r-- 1  883 Mar  3 00:15 localhost-ec-secp384r1.pem
-rw-r--r-- 1  686 Mar  3 00:15 localhost-ec-secp521r1.der
-rw-r--r-- 1  384 Mar  3 00:15 localhost-ec-secp521r1.key
-rw-r--r-- 1  985 Mar  3 00:15 localhost-ec-secp521r1.pem
-rw-r--r-- 1  947 Mar  3 00:15 localhost-rsa-2048.der
-rw-r--r-- 1 1704 Mar  3 00:15 localhost-rsa-2048.key
-rw-r--r-- 1 1338 Mar  3 00:15 localhost-rsa-2048.pem
-rw-r--r-- 1 1459 Mar  3 00:15 localhost-rsa-4096.der
-rw-r--r-- 1 3268 Mar  3 00:15 localhost-rsa-4096.key
-rw-r--r-- 1 2033 Mar  3 00:15 localhost-rsa-4096.pem
```
