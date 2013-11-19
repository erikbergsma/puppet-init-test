class rootpassscrambler {

  exec { "scrambleRootPassword":
    command => "/bin/sh /tmp/scrambleRootPassword.sh",
    path    => "/bin/bash:/bin/sh:/sbin:/usr/sbin"
  }
  
  file { "/tmp/scrambleRootPassword.sh":
    path    => "/tmp/scrambleRootPassword.sh",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source => "puppet:///modules/rootpassscrambler/scrambleRootPassword.sh",
    before => Exec["scrambleRootPassword"]
  }
}

