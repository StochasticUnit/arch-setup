# Software installed from source

source ./setup_env.sh

if [ ! -d ${BIN} ]; then
	mkdir -p ${BIN}
fi

# John The Ripper
cd ${BIN}

build_john() {
	cd src
	sudo ./configure
	make -s clean && make -sj4
}

if [ ! -d john ]; then
	git clone https://github.com/magnumripper/JohnTheRipper.git john
	cd john
	build_john
	cd ../run
	echo "alias john='`pwd`/john'" >> $SHELLRC
else
	cd john
	git pull
	build_john
fi

# Gobuster
cd ${BIN}

if [ ! -d gobuster ]; then
	git clone https://github.com/OJ/gobuster.git
	cd gobuster
	make linux
	go get && go build
	go install
else
	cd gobuster
	git pull
	make linux
	go get && go build
	go install
fi

