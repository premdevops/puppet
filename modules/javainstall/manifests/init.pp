class javainstall { 

$java_source      = hiera('general.profile.javainstall.source')
$java_servicename = hiera('general.profile.javainstall.servicename')
$java_dir         = hiera('general.profile.javainstall.dir')
$java_zipdir      = hiera('general.profile.javainstall.zipdir')
$java_zipfile     = hiera('general.profile.javainstall.zipfile')
$java_localsource = hiera('general.profile.javainstall.localsource')
$java_link        = hiera('general.profile.javainstall.link')
$java_jpath       = hiera('general.profile.javainstall.jpath')
$java_ppath       = hiera('general.profile.javainstall.profile_path')
$java_psource     = hiera('general.profile.javainstall.profile_source')
$java_username    = hiera('general.credens.wget.username')
$java_password    = hiera('general.credens.wget.password')



wget::fetch { 'java_download' :
      source      => $java_source,
      destination => $java_zipdir,
      user        => $java_username,
      password    => $java_password,
      timeout     => 0,
      verbose     => false,
    } ->


exec { 'java_unzip' :

     path => $java_jpath,
     cwd => '/RemoteSource',
     command => $java_zipfile,
} -> 


file { $java_dir :
        ensure => present,
        source => $java_localsource,
        alias => $java_servicename,
        recurse => "inf",
        purge => "false",
} ->

exec { 'java_link' :
     path   => $java_jpath,
     command => $java_link,
 } ->


file  { 'Profile' :
      path      => $java_ppath,
      ensure    => file,
      source    => $java_psource,
      checksum  => md5,
}
} 
