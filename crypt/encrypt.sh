#!/bin/bash
#@author Filip Oščádal <oscadal@gscloud.cz>

dir="$(dirname "$0")"
. $dir/_includes.sh

FILES="id_rsa id_rsa.pub"

if [ -z "${PASS}" ]; then
  info "Manage keys (interactive) ..."
  read -s -p "Enter password:" PASS
  echo -ne "\n"
  export PASS
else
  info "Manage keys (automatic) ..."
fi

for i in $FILES
do
  if [ -f "$i" ]
  then
    openssl aes-256-cbc -pbkdf2 -pass env:PASS -in ./$i -out ./$i".aes"
  else
    warn "Missing file: $i"
  fi
done

echo -en "\nDone.\n"
