systemctl stop firewalld.service
systemctl disable firewalld.service
#BBR
wget –no-check-certificate https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/install_bbr.sh 
chmod +x install_bbr.sh 
./install_bbr.sh

#v2fly
wget https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/v2fly_install.sh
chmod -R 777 v2fly_install.sh
./v2fly_install.sh

#wget -cO /usr/local/etc/v2ray/config.json https://raw.githubusercontent.com/aleooooo/s5-v2fly/main/v2fly_config.json
chmod -R 777 /usr/local/etc/v2ray/config.json
echo '{"inbounds":[{"port":443,"protocol":"vmess","settings":{"clients":[{"id":"ffffffff-ffff-ffff-ffff-ffffffffffff","alterId":0}]}}],"outbounds":[{"protocol":"freedom","settings":{}}]}' > /usr/local/etc/v2ray/config.json 
#gost
wget https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz
gunzip gost-linux-amd64-2.11.1.gz
mv gost-linux-amd64-2.11.1 /usr/bin/gost
chmod -R 777 /usr/bin/gost


chmod +x /etc/rc.d/rc.local
echo -e 'systemctl enable v2ray\nsystemctl start v2ray\nnohup gost -L root:asd12345@0.0.0.0:1080 > /dev/null 2>&1 &' >> /etc/rc.d/rc.local
reboot
