#!/bin/sh

#we need this in order to communicate with github

homefolder=$(eval echo ~$(whoami))
SSHConfigFile="${homefolder}/.ssh/config"
grep github.com ${SSHConfigFile} 2>&1 >/dev/null

if [[ ${?} -ne 0 ]]; then

	VPN_IP=$(ip -4 addr list eth0 | awk '/inet/{split($2, a, "/"); print a[1]}' | sed -e 's/\.[0-9]*$/.2/g')

	while [[ "${VPN_IP}" == "" ]]; do
		VPN_IP=$(ip -4 addr list eth0 | awk '/inet/{split($2, a, "/"); print a[1]}' | sed -e 's/\.[0-9]*$/.2/g')
		/usr/bin/sleep 1
	done

	echo "host github.com" > ${SSHConfigFile}
	echo "    user root" >> ${SSHConfigFile}
	echo "    hostname github.com" >> ${SSHConfigFile}
	echo "    port 22" >> ${SSHConfigFile}
	echo "    proxycommand corkscrew ${VPN_IP} 3128 %h %p" >> ${SSHConfigFile}
	echo "    StrictHostKeyChecking no" >> ${SSHConfigFile}
fi
