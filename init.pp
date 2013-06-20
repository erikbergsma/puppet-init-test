node erik-puppet-test {
    include ntp
}

class ntp {

    package { "ntp": 
        ensure => installed 
    }

    service { "ntp":
        ensure => running,
    }
}