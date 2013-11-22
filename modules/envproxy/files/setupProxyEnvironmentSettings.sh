#!/bin/sh

# Get Cloudp/bin/ipe VPN instance IP, should end on .2
VPN_IP=$(/bin/ip -4 addr list eth0 | /usr/bin/awk '/inet/{split($2, a, "/"); print a[1]}' | /bin/sed -e 's/\.[0-9]*$/.2/g')

while [[ "${VPN_IP}" == "" ]]; do
	VPN_IP=$(/bin/ip -4 addr list eth0 | /usr/bin/awk '/inet/{split($2, a, "/"); print a[1]}' | /bin/sed -e 's/\.[0-9]*$/.2/g')
	sleep 1
done

# Setup environment variables for cloudp/bin/ipe web proxy
/bin/echo -e "http_proxy=\"http://${VPN_IP}:3128\"
HTTP_PROXY=\"http://${VPN_IP}:3128\"
https_proxy=\"http://${VPN_IP}:3128\"
HTTPS_PROXY=\"http://${VPN_IP}:3128\"
ftp_proxy=\"http://${VPN_IP}:3128\"
FTP_PROXY=\"http://${VPN_IP}:3128\"
no_proxy=\"localhost,127.0.0.1,169.254.169.254,.cloud\"
NO_PROXY=\"localhost,127.0.0.1,169.254.169.254,.cloud\"
RSYNC_PROXY=\"${VPN_IP}:3128\"" > /etc/env.d/10cloud

/usr/sbin/env-update