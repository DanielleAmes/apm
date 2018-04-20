#!/bin/sh

sudo mkdir /var/log/telegraf/
sudo touch /var/log/telegraf/telegraf.log
sudo chmod 775 /var/log/telegraf/telegraf.log

wget https://dl.influxdata.com/telegraf/releases/telegraf_1.5.3-1_amd64.deb
sudo dpkg -i telegraf_1.5.3-1_amd64.deb

telegraf -sample-config -input-filter socket_listener:mem:cpu -output-filter influxdb > config.conf.new

sudo cp ../telegraf.conf /etc/telegraf/telegraf.conf

sudo service telegraf start
sudo service telegraf restart
sudo service telegraf status

sleep 20

cat /var/log/telegraf/telegraf.log
