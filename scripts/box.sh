#!/bin/bash

if [[ $# -eq 0 ]]; then
  exit 1
fi

properties=$(cat ../_data/properties.yml | grep ':' | grep -v '  label:' | tr -d ':')
all_services_software=$(cat ../_data/all-services-software.yml | grep ':' | grep -v '  label:' | tr -d ':')
pentest_services_software=$(cat ../_data/pentest-services-software.yml | grep ':' | grep -v '  label:' | tr -d ':')
attacks_techniques=$(cat ../_data/attacks-techniques.yml | grep ':' | grep -v '  label:' | tr -d ':')
subtechniques_spoiler=$(cat ../_data/subtechniques-spoiler.yml | grep ':' | grep -v '  label:' | tr -d ':')

while true; do
  echo -e "[*] Columns :\n  [1] Properties\n  [2] All Services/Software\n  [3] Pentest Services/Software\n  [4] Attacks/Techniques\n  [5] Subtechniques (spoiler)\n  [0] Finish"
  echo -ne "\n[?] Column (number): "
  read option

  case $option in
    1)
      while true; do
        cat $1 | grep -oP "^properties:$" &>/dev/null
        if [[ "$(echo $?)" != 0 ]]; then
          echo "properties:" >> $1
        fi
        echo -ne "[?] property: "
        read property
        echo $properties | tr ' ' '\n' | grep -oP "^$property$" &>/dev/null
        if [[ "$(echo $?)" == "0" ]]; then
          echo -e "  $property: a" >> $1
        else
          break
        fi
      done
    ;;
    2)
      while true; do
        cat $1 | grep -oP "^all-services-software:$" &>/dev/null
        if [[ "$(echo $?)" != 0 ]]; then
          echo "all-services-software:" >> $1
        fi
        echo -ne "[?] all-services-software: "
        read service_software1
        echo $all_services_software | tr ' ' '\n' | grep -oP "^$service_software1$" &>/dev/null
        if [[ "$(echo $?)" == "0" ]]; then
          echo -e "  $service_software1: a" >> $1
        else
          break
        fi
      done
    ;;
    3)
      while true; do
        cat $1 | grep -oP "^pentest-services-software:$" &>/dev/null
        if [[ "$(echo $?)" != 0 ]]; then
          echo "pentest-services-software:" >> $1
        fi
        echo -ne "[?] pentest-services-software: "
        read service_software2
        echo $pentest_services_software | tr ' ' '\n' | grep -oP "^$service_software2$" &>/dev/null
        if [[ "$(echo $?)" == "0" ]]; then
          echo -e "  $service_software2: a" >> $1
        else
          break
        fi
      done
    ;;
    4)
      while true; do
        cat $1 | grep -oP "^attacks-techniques:$" &>/dev/null
        if [[ "$(echo $?)" != 0 ]]; then
          echo "attacks-techniques:" >> $1
        fi
        echo -ne "[?] attacks-techniques: "
        read technique
        echo $attacks_techniques | tr ' ' '\n' | grep -oP "^$technique$" &>/dev/null
        if [[ "$(echo $?)" == "0" ]]; then
          echo -e "  $technique: a" >> $1
        else
          break
        fi
      done
    ;;
    5)
      while true; do
        cat $1 | grep -oP "^subtechniques-spoiler:$" &>/dev/null
        if [[ "$(echo $?)" != 0 ]]; then
          echo "subtechniques-spoiler:" >> $1
        fi
        echo -ne "[?] subtechniques-spoiler: "
        read subtechnique
        echo $subtechniques_spoiler | tr ' ' '\n' | grep -oP "^$subtechnique$" &>/dev/null
        if [[ "$(echo $?)" == "0" ]]; then
          echo -e "  $subtechnique: a" >> $1
        else
          break
        fi
      done
    ;;
    0)
      break
    ;;
    *)
      exit 1
    ;;
  esac
done

echo -e "\n---" >> $1
