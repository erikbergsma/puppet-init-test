class envproxy {

  exec { "setProxyTroughBashScript":
    command => "/bin/sh /tmp/setEnvProxy.sh",
    path    => "/bin/bash:/bin/sh:/sbin:/usr/sbin"
  }
  
  file { "/tmp/setEnvProxy.sh":
    path    => "/tmp/setEnvProxy.sh",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source => "puppet:///modules/envproxy/setupProxyEnvironmentSettings.sh",
    before => Exec["setProxyTroughBashScript"]
  }
}

