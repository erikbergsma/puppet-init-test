class sshkeys {
  
  exec { "generateSshKeys":
    command => '/usr/bin/ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa',
    path    => "/bin/bash:/bin/sh:/sbin:/usr/sbin",
    unless  => "/usr/bin/test -f ~/.ssh/id_rsa.pub"
  }
  
}

