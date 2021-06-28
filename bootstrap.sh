#!/bin/bash
if [ $EUID = 0 ]
  then echo "Please run as non root user"
  exit
fi

echo "add git and ansible repositories"
ADD_REPOSITORIES="sudo add-apt-repository ppa:git-core/ppa ppa:ansible/ansible"
echo $ADD_REPOSITORIES
$ADD_REPOSITORIES
echo "install common dependencies"
UPDATE_APT="sudo apt update"
echo $UPDATE_APT
$UPDATE_APT
INSTALL_DEPS=" sudo apt-get install -y build-essential \
curl \
software-properties-common \
python3 \
git \
ansible \
snapd \
snapd-xdg-open \
python3-pip \
python3-venv \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release
"
echo $INSTALL_DEPS
$INSTALL_DEPS
INSTALL_PYTHON_DEPS="sudo pip3 install boto3 \
awscli \
"
echo $INSTALL_PYTHON_DEPS
$INSTALL_PYTHON_DEPS
INSTALL_PYTHON_DEPS="sudo pip3 install boto3 \
awscli \
"
echo $INSTALL_PYTHON_DEPS
$INSTALL_PYTHON_DEPS
echo "install chrome"
GET_CHROME="wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
echo $GET_CHROME
$GET_CHROME
INSTALL_CHROME="sudo apt install -y ./google-chrome-stable_current_amd64.deb"
echo $INSTALL_CHROME
$INSTALL_CHROME
REMOVE_CHROME_INSTALLER="rm ./google-chrome-stable_current_amd64.deb"
echo $REMOVE_CHROME_INSTALLER
$REMOVE_CHROME_INSTALLER
SET_CHROME_DEFAULT_BROWSER="xdg-mime default google-chrome.desktop text/html && \
xdg-mime default google-chrome.desktop x-scheme-handler/http && \
xdg-mime default google-chrome.desktop x-scheme-handler/https && \
xdg-mime default google-chrome.desktop x-scheme-handler/about"
echo $SET_CHROME_DEFAULT_BROWSER
$SET_CHROME_DEFAULT_BROWSER
echo "install postman"
INSTALL_POSTMAN="sudo snap install postman"
echo $INSTALL_POSTMAN
$INSTALL_POSTMAN
UPDATE_POSTMAN="sudo snap refresh postman"
echo $UPDATE_POSTMAN
$UPDATE_POSTMAN
echo "install node"
INSTALL_NODE="sudo snap install node --classic --channel=14"
echo $INSTALL_NODE
$INSTALL_NODE
UPDATE_NODE="sudo snap refresh node --classic --channel=14"
echo $UPDATE_NODE
$UPDATE_NODE
echo "install vscode"
INSTALL_CODE="sudo snap install --classic code"
echo $INSTALL_CODE
$INSTALL_CODE
UPDATE_CODE="sudo snap refresh --classic code"
echo $UPDATE_CODE
$UPDATE_CODE
echo "install docker"
DOCKER_INSTALL_SRCIPT="curl -fsSL https://get.docker.com -o get-docker.sh"
echo $DOCKER_INSTALL_SRCIPT
$DOCKER_INSTALL_SRCIPT
INSTALL_DOCKER="sudo sh get-docker.sh"
echo $INSTALL_DOCKER
$INSTALL_DOCKER
RM_DOCKER="rm get-docker.sh"
echo $RM_DOCKER
$RM_DOCKER
CREATE_DOCKER_GROUP="sudo groupadd docker"
echo $CREATE_DOCKER_GROUP
$CREATE_DOCKER_GROUP
ADD_USER_TO_DOCKER="sudo usermod -aG docker $USER"
echo $ADD_USER_TO_DOCKER
$ADD_USER_TO_DOCKER
GET_INSTALL_SCRIPT=" wget -O bootstrap.py https://api.github.com/repos/Price-Point/development-bootstrap/contents/bootstrap.py --header 'Accept: application/vnd.github.v3.raw'"
echo $GET_INSTALL_SCRIPT
$GET_INSTALL_SCRIPT
RUN_INSTALL_SCRIPT="python3 bootstrap.py < $1"
echo $RUN_INSTALL_SCRIPT
$RUN_INSTALL_SCRIPT
RM_INSTALL_SCRIPT="rm bootstrap.py"
echo $RM_INSTALL_SCRIPT
$RM_INSTALL_SCRIPT


