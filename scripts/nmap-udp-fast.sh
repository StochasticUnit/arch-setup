if [ $# -ne 2 ]; then
	echo "Usage: nmap-tcp-quick.sh <TARGET> <OUTPUT-FILE>"
	exit 1
fi

nmap -Pn -sU --stats-every 3m --max-retries 1 --max-scan-delay 20 -T4 -F -oA $2 $1

