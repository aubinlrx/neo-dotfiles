#!/usr/bin/env bash

echo "Installing go..."

curl -O https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
tar xvf go1.14.4.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local
rm go1.13.8.linux-amd64.tar.gz
