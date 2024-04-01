#!/bin/bash

declare -A machines=(
  ["fedora28"]="2222"
  ["ubuntu2204"]="2200"
  ["debian10"]="2201"
  ["rocky9"]="2202"
  ["arch"]="2203"
)

commands="cat /etc/os-release | grep PRETTY_NAME"

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
reset=$(tput sgr0)

for machine in "${!machines[@]}"; do
  echo "${red}Fetching OS information from ${yellow}$machine...${reset}"
  echo "${green}"
  sshpass -p1 ssh -o StrictHostKeyChecking=accept-new -p "${machines[$machine]}" mj@localhost "$commands"
  echo "${reset}"
  
  echo "${yellow}---------------------------------------------${reset}"
done
