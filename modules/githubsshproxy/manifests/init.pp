class githubsshproxy {

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

