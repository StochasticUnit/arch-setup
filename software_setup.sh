#
# Environment
#
source ./setup_env.sh

#
# Basic software
#

# Devel
sudo pacman -Sy gcc python

#
# External software
#

# https://www.sublimetext.com/docs/3/linux_repositories.html#pacman
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text

#
# Security Software
#

# John the Ripper
cd ${BIN}
if [ ! -d ./john ]; then
	git clone https://github.com/magnumripper/JohnTheRipper.git john
fi
cd john
git pull

# Penetration Testing Framework
cd ${BIN}
if [ ! -d ./ptf ]; then
	git clone https://github.com/trustedsec/ptf
fi
cd ptf
git pull