#!/bin/sh
#set -x

#we need this in order to communicate with github

homefolder=$(eval /bin/echo ~$(whoami))
SSHConfigFile="${homefolder}/.ssh/config"

string=$(grep -o github.com ${SSHConfigFile} 2>/dev/null | head -n1)

if [[ ${string} != "github.com" ]]; then

	VPN_IP=$(/bin/ip -4 addr list eth0 | /usr/bin/awk '/inet/{split($2, a, "/"); print a[1]}' | /bin/sed -e 's/\.[0-9]*$/.2/g')
	
	while [[ "${VPN_IP}" == "" ]]; do
		VPN_IP=$(/bin/ip -4 addr list eth0 | /usr/bin/awk '/inet/{split($2, a, "/"); print a[1]}' | /bin/sed -e 's/\.[0-9]*$/.2/g')
	
		/usr/bin/sleep 1
	done
	
	/bin/echo "" >> ${SSHConfigFile}
	/bin/echo "host github.com" >> ${SSHConfigFile}
	/bin/echo "    user root" >> ${SSHConfigFile}
	/bin/echo "    hostname github.com" >> ${SSHConfigFile}
	/bin/echo "    port 22" >> ${SSHConfigFile}
	/bin/echo "    proxycommand corkscrew ${VPN_IP} 3128 %h %p" >> ${SSHConfigFile}
	/bin/echo "    StrictHostKeyChecking no" >> ${SSHConfigFile}

fi
