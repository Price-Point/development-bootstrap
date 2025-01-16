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
awscli --break-system-packages \
"
echo $INSTALL_PYTHON_DEPS
$INSTALL_PYTHON_DEPS
INSTALL_PYTHON_DEPS="sudo pip3 install boto3 \
awscli --break-system-packages \
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
INSTALL_NODE="sudo snap install node --classic --channel=16"
echo $INSTALL_NODE
$INSTALL_NODE
UPDATE_NODE="sudo snap refresh node --classic --channel=16"
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
INSTALL_KUBECTL="snap install kubectl --classic"
echo $INSTALL_KUBECTL
$INSTALL_KUBECTL
UPDATE_KUBECTL="snap refresh kubectl --classic"
echo $UPDATE_KUBECTL
$UPDATE_KUBECTL
INSTALL_HELM="curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash"
echo $INSTALL_HELM
$INSTALL_HELM
INSTALL_ARGOCD="sudo curl -sSL -o /tmp/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && sudo cp -r /tmp/argocd /usr/local/bin && sudo chmod +x /usr/local/bin/argocd && sudo rm -rf /tmp/argocd"
echo $INSTALL_ARGOCD
$INSTALL_ARGOCD
GET_SOPS="wget https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb"
echo $GET_SOPS
$GET_SOPS
INSTALL_SOPS="sudo apt install -y ./sops_3.7.1_amd64.deb"
echo $INSTALL_SOPS
$INSTALL_SOPS
REMOVE_SOPS_INSTALLER="rm ./sops_3.7.1_amd64.deb"
echo $REMOVE_SOPS_INSTALLER
$REMOVE_SOPS_INSTALLER
GET_INSTALL_SCRIPT="wget -qO bootstrap.py https://api.github.com/repos/Price-Point/development-bootstrap/contents/bootstrap.py --header 'Accept: application/vnd.github.v3.raw'"
echo $GET_INSTALL_SCRIPT
wget -qO bootstrap.py https://api.github.com/repos/Price-Point/development-bootstrap/contents/bootstrap.py --header 'Accept: application/vnd.github.v3.raw'
RUN_INSTALL_SCRIPT="python3 bootstrap.py"
echo $RUN_INSTALL_SCRIPT
$RUN_INSTALL_SCRIPT
RM_INSTALL_SCRIPT="rm bootstrap.py"
echo $RM_INSTALL_SCRIPT
$RM_INSTALL_SCRIPT


