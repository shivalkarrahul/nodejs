#! /bin/bash
echo " running custom script.."
cd nodejs
git pull origin dev
npm install
pm2 restart nodejs
