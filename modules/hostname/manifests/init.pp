class hostname {
  
  $__myhostname = getHostnameFromMetadata() 

  file { "/etc/conf.d/hostname":
    path    => "/etc/conf.d/hostname",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('hostname/hostname.erb')
  }
}

