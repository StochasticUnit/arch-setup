#!/bin/bash

set -ex

if [ -z "$NARWHAL_SETUP_ENV" ]; then
	source ./setup_env.sh
fi

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

