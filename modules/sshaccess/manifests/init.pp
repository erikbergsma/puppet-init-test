class sshaccess {
  
  $__ssh_access_key = getSshAccessKeyFromMetadata() 

  file { "/root/.ssh/authorized_keys":
    path    => "/root/.ssh/authorized_keys",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('sshaccess/authorized_keys.erb')
  }
}

