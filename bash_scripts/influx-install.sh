#!/bin/sh

wget https://dl.influxdata.com/influxdb/releases/influxdb_1.5.2_amd64.deb
sudo dpkg -i influxdb_1.5.2_amd64.deb

sudo service influxdb start

sudo service influxd start
influx -execute 'CREATE DATABASE metrics'
influx -execute 'CREATE RETENTION POLICY twoweek ON metrics DURATION 14d REPLICATION 1 DEFAULT'

influx -execute 'SHOW DATABASES'
influx -execute 'SHOW RETENTION POLICIES ON metrics'
