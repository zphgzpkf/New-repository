#!/bin/bash

# 设置 screen 会话名称
SCREEN_SESSION="znoderivalz"

# 设置 rivalz 进程名
PROCESS_NAME="rivalz"

# 循环检测，间隔为 1 小时
while true; do
  # 检查 screen 会话中是否运行了 rivalz 进程
  if screen -X screen -S "$SCREEN_SESSION" ps aux | grep -q "$PROCESS_NAME"; then
    echo "$(date) - '$PROCESS_NAME' is running in screen session '$SCREEN_SESSION'."
  else
    echo "$(date) - '$PROCESS_NAME' is NOT running in screen session '$SCREEN_SESSION', restarting..."
    # 重启 rivalz 进程 (创建新的 screen 会话并运行)
    screen -dmS "$SCREEN_SESSION" bash -c 'rivalz run; exec bash'
  fi

  # 等待 1 小时
  sleep 3600
done
