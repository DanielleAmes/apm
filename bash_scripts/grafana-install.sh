#!/bin/sh

wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.0.4_amd64.deb
sudo apt-get install -y adduser libfontconfig
sudo dpkg -i grafana_5.0.4_amd64.deb

sudo cp ../grafana.ini /etc/grafana/grafana.ini

sudo service grafana-server start
sudo service grafana-server status
