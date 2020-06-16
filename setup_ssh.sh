if [ -z "$NARWHAL_SETUP_ENV" ]; then
	source ./setup_env.sh
fi

if [ ! -f $SSHKEY ]; then
	echo "Generating a new SSH keypair"
	ssh-keygen -t rsa -b 4096
fi

if [ -z $(grep "# CONFIG SSH AGENT CONFIGURATION" "$SHELLRC") ]; then
	cat ssh/ssh_agent_config.sh >> $SHELLRC
fi

