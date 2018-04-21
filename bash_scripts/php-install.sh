#!/bin/sh

sudo mkdir /var/data
sudo cp -R ../php-file-demo/data/ /var/
sudo chmod 775 -R /var/data/

sudo apt install php7.0-cli

nohup ../php-file-demo/source/read_files1.php &
nohup ../php-file-demo/source/read_files2.php &
nohup ../php-file-demo/source/read_files3.php &
