export ip=$(ifconfig eth1 | awk '/inet addr/ {print substr($2,6)}')        
consul agent -advertise $(ifconfig eth1 | awk '/inet addr/ {print substr($2,6)}')  -config-file /vagrant/common.config.json &
