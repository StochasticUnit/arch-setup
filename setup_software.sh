# Software installed through apt

. setup_env.sh

# Dev and Languages
sudo apt install git
sudo apt install gcc python

# Setup Golang
sudo apt install golang
if [ -z $(grep "# ADD GO TO PATH" "$SHELLRC") ]; then
        echo >> $SHELLRC
	echo "# ADD GO TO PATH" >> $SHELLRC
	echo "PATH=$PATH:${HOME}/go/bin" >> $SHELLRC
	echo >> $SHELLRC
fi

# General tools
sudo apt install htop tmux

#
# Networking Tools
#

sudo apt install dnsutils
sudo apt install nmap curl
sudo apt install openvpn binwalk

# Dev
sudo apt install libssl-dev

