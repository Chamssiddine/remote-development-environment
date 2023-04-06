# Script that solves our problem with ssh to the instances
IMPORTANT: You need either putting your ssh keys in authorized file or putting it inside the put_here_your_ssh_key_to_send.bash 

## In a nutshell 
1. The script we will create .ssh folder in ~ directory 
2. copy the file "authorized_keys" which container the  public key to the folder we just created or we can echo our ssh keys in ~/.ssh/authorized_keys

NOTE: the cp script is commented 
