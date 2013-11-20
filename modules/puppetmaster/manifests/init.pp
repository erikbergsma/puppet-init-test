class puppetmaster {
  package { "app-admin/puppet":
    ensure => installed
  }

  service { "puppetmaster":
    enable => true
  }
}

