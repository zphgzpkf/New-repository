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
