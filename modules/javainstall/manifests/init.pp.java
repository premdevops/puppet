class javac {
#Hiera Lookups
$java_source      = hiera('monitoring::java_source')
$java_servicename = hiera('monitoring::java_servicename')
$java_dir         = hiera('monitoring::java_dir')
$java_localsource = hiera('monitoring::java_localsource')
$java_jpath       = hiera('monitoring::java_jpath')

#exec { $java_source:
#        alias => $java_servicename,
#        cwd => "/tmp",
#    }

#file { $java_dir:
#        ensure => present,
#        source => $java_localsource,
#        alias => $java_servicename,
#        recurse => "inf",
#        purge => "false",
#}

#exec { 'java':
#     path   => $java_jpath,
#     command => "ln -sf /iqs/jdk1.7.0_51 /iqs/java",

#}

file { '/etc/profile':
  ensure => present,
}->
file_line { 'Append a line to /etc/profile':
  path => '/etc/profile',
  line => 'JAVA_HOME=/iqs/java',
}
}
