#! /bin/bash
echo " running custom script.."
sudo su
cd nodejs
git pull origin dev
npm install
pm2 restart nodejs
