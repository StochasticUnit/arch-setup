# Installing ssh and creating a new keypair

sudo pacman -Sy openssh

if [ ! -f $SSHKEY ]; then
	echo "Generating a new SSH keypair"
	ssh-keygen -t rsa -b 4096
fi

# Is there a check to see if we already did this?
cat resources/ssh/ssh_agent_config.sh >> $SHELLRC