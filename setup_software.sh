# Software install -yed through apt

. setup_env.sh

# Dev and Languages
sudo apt install -y git
sudo apt install -y gcc python
sudo apt install -y vim

# Setup Golang
sudo apt install -y golang
if [ -z $(grep "# ADD GO TO PATH" "$SHELLRC") ]; then
        echo >> $SHELLRC
	echo "# ADD GO TO PATH" >> $SHELLRC
	echo "PATH=$PATH:${HOME}/go/bin" >> $SHELLRC
	echo >> $SHELLRC
fi

# General tools
sudo apt install -y htop tmux

#
# Networking Tools
#

sudo apt install -y dnsutils
sudo apt install -y nmap curl
sudo apt install -y openvpn
sudo apt install -y net-tools wireless-tools

# Dev
sudo apt install -y libssl-dev

# RedTeam and CTF Tools
sudo apt install -y sqlmap
sudo apt install -y binwalk
sudo apt install -y cewl
sudo apt install -y wfuzz
