node default {
	include hostname
	include rootpassscrambler
	include sshaccess
	include sshkeys
	include motd
	include githubsshproxy
	include puppetmaster
}
