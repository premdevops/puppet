class mongodb {

$mongo_service       = hiera('mongo.mongodb.mongodbservice.service')
$mongo_jpath         = hiera('mongo.mongodb.mongodbservice.jpath')
$mongo_source        = hiera('mongo.mongodb.mongodbservice.source')
$mongo_servicename   = hiera('mongo.mongodb.mongodbservice.servicename')
$mongo_dir           = hiera('mongo.mongodb.mongodbservice.dir')
$mongo_zipdir        = hiera('mongo.mongodb.mongodbservice.zipdir')
$mongo_zipfile       = hiera('mongo.mongodb.mongodbservice.zipfile')
$mongo_localsource   = hiera('mongo.mongodb.mongodbservice.localsource')
$mongo_stupscript    = hiera('mongo.mongodb.mongodbservice.startup_script')
$mongo_stuplocation  = hiera('mongo.mongodb.mongodbservice.startup_location')
$mongo_username      = hiera('general.credens.wget.username')
$mongo_password      = hiera('general.credens.wget.password')


wget::fetch { 'mongo_download' :
      source      => $mongo_source,
      destination => $mongo_zipdir,
      user        => $mongo_username,
      password    => $mongo_password,
      timeout     => 0,
      verbose     => false,
    } ->



exec { 'mongo_unzip' :
     path => $mongo_jpath,
     cwd => $mongo_zipdir,
     command => $mongo_zipfile,
} ->

file { $mongo_dir :
        ensure => present,
        source => $mongo_localsource,
        alias => $mongo_servicename,
        recurse => "inf",
        ignore => ["log"],
        purge => "false",
} ->

file { $mongo_stuplocation  :
        ensure  => file,
        source => $mongo_stupscript,
} ->

service { $mongo_service :
        ensure  => running,
        hasstatus => false,
}
}


