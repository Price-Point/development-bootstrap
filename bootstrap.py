import subprocess

apt_packages_to_install = [
  'python-pip',
  'python3-venv',
  'python3-pip'
]

subprocess.check_call('sudo apt-get update', shell=True)
subprocess.check_call('sudo apt-get install -y ' + ' '.join(apt_packages_to_install), shell=True)