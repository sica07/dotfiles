#!/bin/sh
# thuban -- thuban@yeuxdelibad.net.
# Idea from https://sebsauvage.net/wiki/doku.php?id=dns-blocklist
# Licence:  MIT
# Script to generate a /etc/hosts file to blacklist ads
# Add yours in $MYHOSTS in a file passed as argument
#    zerohosts file.txt
echo 'start'
set -e

# DOWNLOADER (to standard output)
#D="wget -O-" # mosts linux
D="curl -L" # with curl
#D="ftp -o-"   # OpenBSD


# Number of days befor updating the list
DAYS=1

# Run only if older than $DAYS
test -z "$(find /etc/hosts -mtime +${DAYS} )" && exit

if [ -f "${1}" ]; then
	MYHOSTS=$(cat "${1}")
else
	MYHOSTS=""
fi

HOSTSSRC="
https://adaway.org/hosts.txt
https://someonewhocares.org/hosts/zero/hosts
https://hosts-file.net/ad_servers.txt
https://www.malwaredomainlist.com/hostslist/hosts.txt
http://winhelp2002.mvps.org/hosts.txt
https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext
"

DOMAINSSRC="
https://mirror.cedia.org.ec/malwaredomains/justdomains
https://mirror.cedia.org.ec/malwaredomains/immortal_domains.txt
https://ransomwaretracker.abuse.ch/downloads/RW_DOMBL.txt
https://feodotracker.abuse.ch/blocklist/?download=domainblocklist
https://zeustracker.abuse.ch/blocklist.php?download=baddomains
"


echo ""
echo "[zerohosts]: running"

TMP=$(mktemp)

echo "[zerohosts]: download lists"
for URL in ${HOSTSSRC}; do
	echo "$URL"
	${D} "${URL}" >> "$TMP"
done

for URL in ${DOMAINSSRC}; do
	echo "$URL"
	${D} "${URL}" | \
		awk '{print "0.0.0.0 " $1}' >> "$TMP"
done

# The following call sed  several times. It is necessary because the
# filter must be applied in order.

echo "[zerohosts]: filter lists"

sed -i -e 's/#.*$//g'  $TMP
echo "Remove ^M"
sed -i -e 's///g' $TMP
echo "Remove empty lines"
sed -i -e '/^[[:space:]]*$/d' $TMP

echo "remove localhosts and ip6"
sed -i -e '/^.*:.*$/d' \
    -e '/^127\.0\.0\.1[[:space:]]*localhost.*$/d' \
    -e '/^255.*$/d' $TMP

echo "127.0.0.1 to 0.0.0.0"
sed -i -e 's/127.0.0.1/0.0.0.0/g' $TMP

echo "remove lines with only one field, somes lists have this."
sed -i -e '/^0\.0\.0\.0[[:space:]]*$/d' $TMP

echo "[zerohosts]: write /etc/hosts"
cat << EOF > /etc/hosts
$(date '+# %Y-%m-%d %H:%M:%S')
127.0.0.1 localhost
::1 localhost
0.0.0.0 0.0.0.0
${MYHOSTS}

$(tr -s '[:blank:]' < $TMP | sort -u)
EOF

chmod 0644 /etc/hosts

echo "[zerohosts]: delete tmp file $TMP"
rm $TMP

echo "[zerohosts]: Bye :)"
exit 0
