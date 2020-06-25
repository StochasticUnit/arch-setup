if [ -z "$NARWHAL_SETUP_ENV" ]; then
	. setup_env.sh
fi

if [ ! -f ~/.vimrc ]; then
	touch ~/.vimrc
fi

