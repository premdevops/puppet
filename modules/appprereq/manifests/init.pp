include '::ntp'
include '::selinux'
include '::snmp'

class appprereq {

class { '::ntp':
  server => [ '10.5.1.11' ],
}

class { '::selinux':
 mode => 'disabled'
}

class { '::snmp':
  agentaddress => [ 'udp:161', ],
  ro_community => [ 'iqs200903' ],
}


}
