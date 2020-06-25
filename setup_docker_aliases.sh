if [ ! -z "$NARWHAL_SETUP_ENV" ]; then
	. setup_env.sh
fi


if [ -z $(grep "zap2docker" "$SHELLRC") ]; then
	echo "alias zap2docker='docker run -u zap -p 8080:8080 -p 8090:8090 -i owasp/zap2docker-stable zap-webswing.sh'" >> $SHELLRC
fi

