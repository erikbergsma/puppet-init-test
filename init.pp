#include ntp
include sshkeys

class ntp {
    package { "ntp": 
        ensure => installed 
    }

    service { "ntp":
        ensure => running,
    }
}

class sshkeys {
 
  ssh_keygen { 'root':
    home => '/root/'
  }

  define ssh_keygen($home=undef) {

    Exec { path => '/bin:/usr/bin' }

    if $home == undef {
      $home_real = "/home/${name}"
    } else {
      $home_real = $home
    }

    file { "$home_real/.ssh/":
      ensure => "directory",
      owner  => $name,
      group  => $name,
      mode   => 0755,
      before => Exec["ssh_keygen-${name}"]
    }

    exec { "ssh_keygen-${name}":
      command => "ssh-keygen -f \"${home_real}/.ssh/id_rsa\" -N '' -C '$hostname'",
      user    => $name,
      creates => "${home_real}/.ssh/id_rsa",
    }

  }
}