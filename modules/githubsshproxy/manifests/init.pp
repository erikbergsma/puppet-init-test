class githubsshproxy {

  #
  # the propper way to do this would be:
  # in ruby / python:
  # get factor local ip
  # calculate the VPN ip based on that
  # set the /root/.ssh/config file based on a template + VPN ip
  #

  exec { "setGithubSshProxy":
    command => "/bin/sh /tmp/setGithubSshProxy.sh",
    path    => "/bin/bash:/bin/sh:/sbin:/usr/sbin"
  }
  
  file { "/tmp/setGithubSshProxy.sh":
    path    => "/tmp/setGithubSshProxy.sh",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source => "puppet:///modules/githubsshproxy/setGithubSshProxy.sh",
    before => Exec["setGithubSshProxy"]
  }
}

