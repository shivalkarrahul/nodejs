#! /bin/bash
echo " running custom script.."
git pull origin dev
npm install
pm2 restart nodejs
