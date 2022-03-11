#!/bin/bash

echo -e "[*] Files:\n  [1] properties.yml\n  [2] all-services-software.yml\n  [3] pentest-services-software.yml\n  [4] attacks-techniques-yml\n  [5] subtechniques-spoiler.yml"
echo -ne "\n[?] File (number): "
read option

case $option in
  1)
    file="properties.yml"
  ;;
  2)
    file="all-services-software.yml"
  ;;
  3)
    file="pentest-services-software.yml"
  ;;
  4)
    file="attacks-techniques.yml"
  ;;
  5)
    file="subtechniques-spoiler.yml"
  ;;

  *)
    exit 1
  ;;
esac

while true; do
  echo -ne "\n[+] Attributes/subattributes: "
  read attribute
  echo -ne "\n[+] label: "
  read label

  echo -e "\n$attribute:\n  label: $label" >> ../_data/$file
done

