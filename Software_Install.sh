#! /bin/bash

printf "Please input the software you'd like to install: "

read install

sudo apt install -y $install
