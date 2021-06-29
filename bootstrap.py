import os
from builtins import input
from pathlib import Path

def multi_line_input(prompt):
      print("Enter/Paste " + prompt + ". Enter Ctrl-D to save it.")
      contents = []
      while True:
            try:
              line = input()
            except EOFError:
              break
            contents.append(line)
      return '\n'.join(contents)

# check if the user want so update their ssh keys
ssh_directory=os.path.join(str(Path.home()),'.ssh');
Path(ssh_directory).mkdir(parents=True, exist_ok=True)
update_ssh = input('Do you want to update existing ssh keys (y | n)? ')
if update_ssh.lower() == 'y':
      public_key = multi_line_input('public ssh key ')
      private_key = multi_line_input('private ssh key')
      with open(os.path.join(ssh_directory, 'id_rsa.pub'), 'wb') as id_rsa_pub:
            id_rsa_pub.write(public_key.encode());
      with open(os.path.join(ssh_directory, 'id_rsa'), 'wb') as id_rsa:
            id_rsa.write(private_key.encode());
      os.chmod(os.path.join(ssh_directory, 'id_rsa'), 0o600)
      os.chmod(os.path.join(ssh_directory, 'id_rsa.pub'), 0o600)
else:
      # to do here generate ssh keys and do the github login dance to
      # to set them up
      print('It is recommended that you have ssh keys')

# make sure ssh is set up to always add keys to the agent
found = False
ssh_config_filename=os.path.join(str(Path.home()),'.ssh', 'config')
ssh_config_content_line='AddKeysToAgent yes\n'
if os.path.exists(ssh_config_filename):
      with open(ssh_config_filename, 'r') as sshconfig:
            for line in sshconfig:
                  if line == ssh_config_content_line:
                        found = True
if found == False:
      with open(ssh_config_filename, 'a') as bashrc:
            bashrc.write(ssh_config_content_line)

# create .ppbashrc and add it to .bashrc
ppbashrc_directory=os.path.join(str(Path.home()),'.ppbashrc')
Path(ppbashrc_directory).mkdir(parents=True, exist_ok=True)
aws_creds_filename=os.path.join(ppbashrc_directory, '.aws_creds')
npm_creds_filename=os.path.join(ppbashrc_directory, '.npm_creds')
ppbashrc_contents="""
source {0}
source {1}
""".format(
      aws_creds_filename,
      npm_creds_filename
)
ppbashrc_filename = os.path.join(ppbashrc_directory, '.bashrc')
with open(ppbashrc_filename, 'w') as ppbashrc:
      ppbashrc.write(ppbashrc_contents);

bashrc_content_line='source ' + ppbashrc_filename
found = False
bashrc_filename=os.path.join(str(Path.home()),'.bashrc')
with open(bashrc_filename, 'r') as bashrc:
      for line in bashrc:
            if line == bashrc_content_line:
                  found = True
if found == False:
      with open(bashrc_filename, 'a') as bashrc:
            bashrc.write(bashrc_content_line)

# get aws-cli login info
update_aws_creds  = input('Do you want to update your aws creds (y | n)? ')
if update_aws_creds.lower() == 'y':
      aws_access_key=input('aws access key ')
      aws_secret=input('aws secret ')
      aws_creds_contents="""export AWS_ACCESS_KEY_ID={0}
export AWS_SECRET_ACCESS_KEY={1}
export AWS_DEFAULT_REGION=us-east-1
export AWS_DEFAULT_OUTPUT=json
""".format(aws_access_key,aws_secret)
      with open(aws_creds_filename, 'w') as aws_creds:
            aws_creds.write(aws_creds_contents)

# get npm token
update_npm_token  = input('Do you want to update your npm creds (y | n)? ')
if update_npm_token.lower() == 'y':
      npm_token=input('npm token ')
      npm_creds_contents="""export NPM_TOKEN={0}
""".format(npm_token)
      with open(npm_creds_filename, 'w') as npm_creds:
            npm_creds.write(npm_creds_contents)