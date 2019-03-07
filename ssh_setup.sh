# Installing ssh and creating a new keypair

sudo pacman -Syu openssh

if [ ! -f $SSHKEY ]; then
	echo "Generating a new SSH keypair"
	ssh-keygen -t rsa -b 4096
fi

# Is there a check to see if we already did this?
# Also that probably only works for bash
cat resources/ssh/ssh_agent_config.sh >> $SHELLRC