#!/bin/bash
lista="dw.sh"

 for qwer in $lista; do
  name="$qwer.encrypt.sh"
  mv $qwer $name
  echo -e "$(cat <(bzip2 -c -d <(cat $name)))" > $qwer

 done
