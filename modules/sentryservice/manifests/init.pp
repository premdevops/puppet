class sentryservice {

$sen_service       = hiera('sen.sentry.sentryservice.service')
$sen_jpath         = hiera('sen.sentry.sentryservice.jpath')
$sen_source        = hiera('sen.sentry.sentryservice.source')
$sen_servicename   = hiera('sen.sentry.sentryservice.servicename')
$sen_dir           = hiera('sen.sentry.sentryservice.dir')
$sen_zipdir        = hiera('sen.sentry.sentryservice.zipdir')
$sen_zipfile       = hiera('sen.sentry.sentryservice.zipfile')
$sen_localsource   = hiera('sen.sentry.sentryservice.localsource')
$sen_stupscript    = hiera('sen.sentry.sentryservice.startup_script')
$sen_stuplocation  = hiera('sen.sentry.sentryservice.startup_location')
$sen_username      = hiera('general.credens.wget.username')
$sen_password      = hiera('general.credens.wget.password')


wget::fetch { 'sen_download' :
      source      => $sen_source,
      destination => $sen_zipdir,
      user        => $sen_username,
      password    => $sen_password,
      timeout     => 0,
      verbose     => false,
    } ->



exec { 'sen_unzip' :
     path => $sen_jpath,
     cwd => $sen_zipdir,
     command => $sen_zipfile,
} ->

file { $sen_dir :
        ensure => present,
        source => $sen_localsource,
        alias => $sen_servicename,
        recurse => "inf",
        ignore => ["log"],
        purge => "false",
} ->

file { $sen_stuplocation  :
        ensure  => file,
        source => $sen_stupscript,
} ->

service { $sen_service :
        ensure  => running,
        hasstatus => false,
}
}


