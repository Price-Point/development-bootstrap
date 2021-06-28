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

# create .ppbashrc and add it to .bashrc
ppbashrc_directory=os.path.join(str(Path.home()),'.ppbashrc')
Path(ppbashrc_directory).mkdir(parents=True, exist_ok=True)
aws_creds_filename=os.path.join(ppbashrc_directory, '.aws_creds')
ppbashrc_contents="""
source {0}
""".format(
      aws_creds_filename
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
      with open(aws_creds_filename, 'w') as bashrc:
            bashrc.write(aws_creds_contents)
