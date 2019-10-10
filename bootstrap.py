from __future__ import print_function
from builtins import input
import subprocess
import getpass

def exit_if_no(to_install, op):
  print('To install dev environment you need to ' + op)
  print(to_install)
  do_install = input('do you want to continue (y | n)')
  if (do_install.lower() != 'y'):
    exit(1)

apt_packages_to_install = [
  'python-pip',
  'python3-venv',
  'python3-pip',
]

pip_packages_to_install = [
  'requests'
]

exit_if_no('\n'.join(apt_packages_to_install + pip_packages_to_install), 'install')

subprocess.check_call('sudo apt-get update', shell=True)
subprocess.check_call('sudo apt-get install -y ' + ' '.join(apt_packages_to_install), shell=True)
subprocess.check_call('sudo pip install ' + ' '.join(pip_packages_to_install), shell=True)

import requests

username = input('GitHub Username:')
password = getpass.getpass()

requirements = requests.get(
  'https://api.github.com/repos/Price-Point/python_misc/contents/requirements.txt',
  headers= { 'Accept': 'application/vnd.github.v3.raw' },
  auth=(username,password))

exit_if_no(requirements.text, 'install')

subprocess.check_call('sudo -H pip install ' + ' '.join(pip_packages_to_install), shell=True)

dev_env_setup = requests.get(
  'https://api.github.com/repos/Price-Point/python_misc/contents/dev_env_setup.py',
  headers= { 'Accept': 'application/vnd.github.v3.raw' },
  auth=(username,password))

exit_if_no(dev_env_setup.text, 'execute')

exec(dev_env_setup.text)