#!/bin/bash
#
GREEN='\033[0;32m'
NC='\033[0m'
printf "${GREEN}[+] Updating Repos...${NC}"
sudo apt update -y
printf "${GREEN}[+] Installing PWK Apps and Upgrades... ${NC}"
sudo apt update && sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git pure-ftpd powercat seclists masscan exploitdb mingw-w64 atftp shellter sshuttle wine crowbar rinetd httptunnel kerberoast metasploit-framework default-libmysqlclient-dev gcc-mingw-w64 sshuttle shellter libreoffice terminator -y && sudo apt upgrade -y && sudo apt autoremove -y

printf "${GREEN}[+] Installing pyenv and Python 2.7.18... ${NC}"
sudo echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
sudo echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
sudo echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init --path)"\nfi' >> ~/.zshrc
curl https://pyenv.run | bash
exec $SHELL
pyenv install 2.7.18
pyenv global 2.7.18
exec $SHELL
pip install pip --upgrade
pip install impacket
pip install pycryptodome

printf "${GREEN}[+] Installing Docker.io and a Debian 10 image...${NC}"
sudo apt install -y docker.io
sudo usermod -aG docker $USER
sudo systemctl enable docker --now
sudo docker pull debian:10
mkdir -p ~/Desktop/DockerShare
sudo docker run --name debian10 -v ~/Desktop/DockerShare:/media -it debian:10 /bin/bash
echo "Docker Forum temporary session key rB51GbhfAyz"

