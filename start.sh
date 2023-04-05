#!/bin/bash

apt-get update

apt-get install sudo

sudo curl -k -o install.sh "https://openp2p.cn/download/v1/latest/install.sh"
chmod 777 install.sh
sudo bash ./install.sh --token 11118800022288831035