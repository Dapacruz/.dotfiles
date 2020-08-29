#!/usr/bin/sh

sudo apt update
xargs sudo apt install -y <packages.txt
