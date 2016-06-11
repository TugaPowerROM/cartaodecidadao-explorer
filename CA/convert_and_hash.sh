#!/bin/bash
# Copyright (C) 2016, Nuno Goncalves <nunojpg@gmail.com>


for filename in *.cer *.crt
do
	base_filename="${filename%.*}"
	hash="$(openssl x509 -inform DER -in "$filename" -out "$base_filename".pem -hash)"
	ln -s "$base_filename".pem "$hash".0
done
