#!/bin/bash
source /app/config.sh

service ssh start
service nginx start

#echo "set ngrok token: $NGROK_TOKEN"
#ngrok authtoken $NGROK_TOKEN
#echo "start ngrok service"
#ngrok tcp 222 --log=stdout > ngrok.log

echo "启动nginx成功"
tail -f /var/log/nginx/access.log
