#!/bin/bash
apt update
apt install unzip -y



# installs fnm (Fast Node Manager)
curl -fsSL https://fnm.vercel.app/install | bash

# activate fnm
source ~/.bashrc

# download and install Node.js
fnm use --install-if-missing 22



npm install -g npm@11.0.0

npm i -g rivalz-node-cli

apt install screen  



screen -S znoderivalz

rivalz run

# 设置 crontab 任务
CRON_COMMAND="0 */6 * * * screen -dmS znoderivalz bash -c 'rivalz run; exec bash'"

# 检查是否已经存在该 crontab 任务
if crontab -l | grep -q "$CRON_COMMAND"; then
  echo "Cron job already exists. Skipping crontab setup."
else
  echo "$CRON_COMMAND" | crontab -
  echo "Cron job added successfully."
fi

# 立即启动 screen 会话
screen -dmS znoderivalz bash -c 'rivalz run; exec bash'
echo "Screen session 'znoderivalz' started."


# 显示当前运行的 screen 会话
echo "Current running screen sessions:"
screen -ls

echo "All done."
