node default {
	include hostname
	include rootpassscrambler
	include envproxy
	include sshaccess
	include sshkeys
	include motd
	include githubsshproxy
	include gitclient
	include puppetmaster
}
