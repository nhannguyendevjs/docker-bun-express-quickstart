#!/bin/bash

echo "-------------------- BEGIN($(date)) --------------------"
service nginx restart
. ~/.nvm/nvm.sh && pm2 stop all
. ~/.nvm/nvm.sh && pm2 delete all
. ~/.nvm/nvm.sh && cd ~/projects/bun-express-quickstart && pm2 start "bun index.ts" --name bun-express-quickstart
cd ~
echo "Nginx started"
echo "NS Bun Express Quickstart started"
echo "-------------------- DONE($(date)) --------------------"
