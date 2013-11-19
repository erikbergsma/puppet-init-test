#!/bin/sh

# Get Cloudpipe VPN instance IP, should end on .2
VPN_IP=$(ip -4 addr list eth0 | awk '/inet/{split($2, a, "/"); print a[1]}' | sed -e 's/\.[0-9]*$/.2/g')

# Setup environment variables for cloudpipe web proxy
echo -e "http_proxy=\"http://${VPN_IP}:3128\"
HTTP_PROXY=\"http://${VPN_IP}:3128\"
https_proxy=\"http://${VPN_IP}:3128\"
HTTPS_PROXY=\"http://${VPN_IP}:3128\"
ftp_proxy=\"http://${VPN_IP}:3128\"
FTP_PROXY=\"http://${VPN_IP}:3128\"
no_proxy=\"localhost,127.0.0.1,169.254.169.254,.cloud\"
NO_PROXY=\"localhost,127.0.0.1,169.254.169.254,.cloud\"
RSYNC_PROXY=\"${VPN_IP}:3128\"" > /etc/env.d/10cloud

/usr/sbin/env-update
