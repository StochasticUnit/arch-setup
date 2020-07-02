#!/bin/bash

set -ex

source ./setup_env.sh

if [ ! -d "${RESRC}" ]; then
	mkdir -p ${RESRC}
fi

cd ${RESRC}

if [ ! -d lists ]; then
	git clone https://github.com/danielmiessler/SecLists.git lists
else
	cd lists
	git pull
	cd -
fi

