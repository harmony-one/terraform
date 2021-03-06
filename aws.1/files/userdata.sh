#!/bin/bash

sudo yum update -y
sudo yum install -y bind-utils
sudo yum install -y jq

curl https://rclone.org/install.sh | sudo bash

mkdir -p /home/ec2-user/.hmy
mkdir -p /home/ec2-user/.config/rclone

chown -R ec2-user /home/ec2-user/.hmy
chown -R ec2-user /home/ec2-user/.config

curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar xfz node_exporter-1.0.1.linux-amd64.tar.gz
mv -f node_exporter-1.0.1.linux-amd64/node_exporter /usr/local/bin
rm -rf node_exporter-1.0.1.linux-amd64.tar.gz node_exporter-1.0.1.linux-amd64
useradd -rs /bin/false node_exporter
chown node_exporter.node_exporter /usr/local/bin/node_exporter
