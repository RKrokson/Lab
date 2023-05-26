#!/bin/bash

apt-get update -y && apt-get upgrade -y
apt-get install haproxy -y

touch /etc/haproxy/haproxy.cfg
cat >> /etc/haproxy/haproxy.cfg <<EOF

frontend Local_Server
    bind x.x.x.x:3306
    mode tcp
    option mysql-check user haproxy_check
    default_backend MySQL_Servers

backend MySQL_Servers
    mode tcp
    balance roundrobin
    option mysql-check user haproxy_check
    server server1 y.y.y.y:3306 check

listen stats
    bind x.x.x.x:8404
    stats enable
    stats uri /monitor
    stats refresh 5s
EOF

myip=`hostname -i | awk '{print $1}'`
sed -i "s/x.x.x.x/$myip/" /etc/haproxy/haproxy.cfg
onpremweb=$1
sed -i "s/y.y.y.y/$onpremweb/" /etc/haproxy/haproxy.cfg
sudo service haproxy restart