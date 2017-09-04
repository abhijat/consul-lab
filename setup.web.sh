#!/usr/bin/env bash

export ip=$(ifconfig eth1 | awk '/inet addr/ {print substr($2,6)}')
echo "<h1> ${ip} :: $(hostname)</h1>" > /home/vagrant/ip.html

docker run -d --name web -p 8080:80 --restart unless-stopped -v /home/vagrant/ip.html:/usr/share/nginx/html/ip.html:ro nginx
