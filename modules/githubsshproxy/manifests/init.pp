class githubsshproxy {

  $__ip = delete_at(split($::ipaddress, "[.]"), 3)
  $__proxy_ip = join(concat($__ip,['2']), ".")

  file { "/root/.ssh/config":
    path    => "/root/.ssh/config",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('githubsshproxy/config.erb')
  }
}

