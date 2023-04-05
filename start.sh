#!/bin/bash
source /app/config.sh

service ssh start
service nginx start

#echo "set ngrok token: $NGROK_TOKEN"
#ngrok authtoken $NGROK_TOKEN
#echo "start ngrok service"
#ngrok tcp 222 --log=stdout > ngrok.log

echo "启动nginx成功"

apt-get update
echo "更新成功"

apt-get install net-tools
echo "安装net-tools成功"

apt-get install tinyproxy -y
echo "安装tinyproxy成功"

service tinyproxy start
echo "启动tinyproxy成功"

tail -f /var/log/tinyproxy/tinyproxy.log
