#!/bin/bash

source /app/config.sh

service ssh start
service nginx start

echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN
echo "start ngrok service"
ngrok tcp 22 --log=stdout > ngrok.log


apt-get update
apt-get install sudo

sudo curl -k -o install.sh "https://openp2p.cn/download/v1/latest/install.sh"
chmod 777 install.sh
sudo  ./root/install.sh --token 11118800022288831035