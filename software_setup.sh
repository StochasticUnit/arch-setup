#
# Environment
#
source ./setup_env.sh

#
# Basic software
#

# Devel
sudo pacman -Sy gcc python go

# General tools
sudo pacman -Sy htop tmux p7zip libpst wget

#
# External software
#

# https://www.sublimetext.com/docs/3/linux_repositories.html#pacman
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Sy sublime-text

#
# Networking 
#

sudo pacman -Sy net-snmp dnsutils

# Turns out the version of curls packaged with arch doesn't have some
# of the features you might want.  Let's pull and build from git!
# TODO: uninstall the package manager version of curl
sudo pacman -Sy c-ares
cd ${BIN}
if [ ! -d ./curl ]; then
	git clone https://github.com/curl/curl.git
fi
cd curl
git pull
./buildconf
./configure --with-libssh2 --enable-smp --enable-ares
make -j8

#
# Security Software
#

sudo pacman -Sy openvpn binwalk nmap

# John the Ripper
cd ${BIN}
if [ ! -d ./john ]; then
	git clone https://github.com/magnumripper/JohnTheRipper.git john
fi
cd john
git pull
cd src
sudo pacman -Sy opencl-headers bash-completion gmp
sudo ./configure
make -s clean && make -sj4
cd ../run
echo "export PATH=$PATH:`pwd`" >> $SHELLRC

# Gobuster
git clone https://github.com/OJ/gobuster.git
cd gobuster
make linux

# Lists
cd ~/
mkdir -p resources
cd resources
git clone https://github.com/danielmiessler/SecLists.git seclists

# Penetration Testing Framework
sudo pacman -Sy libidn
cd ${BIN}
if [ ! -d ./ptf ]; then
	git clone https://github.com/trustedsec/ptf
fi
cd ptf
git pull

# DNS Recon
cd ${BIN}
if [ ! ./dnsrecon ]; then
	git clone https://github.com/darkoperator/dnsrecon
fi
