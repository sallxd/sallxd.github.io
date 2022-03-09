#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
Lyellow='\e[93m'
bd='\e[1m'
clear
git clone https://github.com/sallxd/perizinan.git 
chmod +x /root/perizinan/main/allow
clear
echo -e "${GREEN}Input IP${NC} "
read -e -p "( CLIENT ):" user
CLIENT_EXISTS=$(grep -w $user /root/perizinan/main/allow | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo ""
echo -e "\e[33m vps sudah terdaftar.\033[0m"
exit 1
fi
clear
read -p "Expired (days): " masaaktif
clear
exp=date -d "$masaaktif days" +"%Y-%m-%d"
read -e -p "( IP VPS ):" ipvps
cd /root/perizinan
echo -e "### $user $exp $ipvps" >> /root/perizinan/main/allow
git config --global user.email "faisalardan132@gmail.com" &> /dev/null
git config --global user.name "sallxd" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m m &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/sallxd/perizinan.git
git push -f https://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@github.com/sallxd/perizinan.git &> /dev/null
clear
echo -e ""
echo -e ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m • Your IP Has Been Registered •\E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Nama     : $user"
echo "Expired ON : $exp"
echo "IP VPS :$ipvps"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e ""