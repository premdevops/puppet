class esprocessservice {

$es_service       = hiera('es.esprocess.esprocessservice.service')
$es_jpath         = hiera('es.esprocess.esprocessservice.jpath')
$es_source        = hiera('es.esprocess.esprocessservice.source')
$es_servicename   = hiera('es.esprocess.esprocessservice.servicename')
$es_dir           = hiera('es.esprocess.esprocessservice.dir')
$es_zipdir        = hiera('es.esprocess.esprocessservice.zipdir')
$es_zipfile       = hiera('es.esprocess.esprocessservice.zipfile')
$es_localsource   = hiera('es.esprocess.esprocessservice.localsource')
$es_stupscript    = hiera('es.esprocess.esprocessservice.startup_script')
$es_stuplocation  = hiera('es.esprocess.esprocessservice.startup_location')
$es_username      = hiera('general.credens.wget.username')
$es_password      = hiera('general.credens.wget.password')
#$es_mailto        = hiera('routine.monitoring.relevant.mailto')
#$es_ioe           = hiera('routine.monitoring.relevant.ioe')
#$es_oom           = hiera('routine.monitoring.relevant.oom')
#$es_diskfull      = hiera('routine.monitoring.relevant.diskfull')
#$es_nospace       = hiera('routine.monitoring.relevant.nospace')
#$es_null          = hiera('routine.monitoring.relevant.null')
#$es_nohup         = hiera('es.esprocess.esprocessservice.nohup')
#$es_mailoom       = hiera('es.esprocess.esprocessservice.mailoom')
#$es_maillog       = hiera('es.esprocess.esprocessservice.maillog')

wget::fetch { 'es_download' :
      source      => $es_source,
      destination => $es_zipdir,
      user        => $es_username,
      password    => $es_password,
      timeout     => 0,
      verbose     => false,
    } ->

exec { 'es_unzip' :
     path => $es_jpath,
     cwd => $es_zipdir,
     command => $es_zipfile,
} ->

file { $es_dir :
        ensure => present,
        source => $es_localsource,
        alias => $es_servicename,
        recurse => "inf",
        ignore => ["log"],
        purge => "false",
} ->

file { $es_stuplocation  :
        ensure  => file,
        source => $es_stupscript,
} ->

service { $es_service :
        ensure  => running,
        hasstatus => false,
} 

#exec { 'es_OOM':
#  path => $es_jpath,
#  command =>    "sed -i 's/$es_ioe/java.io.IOException CHECKED: Map failed/g' $es_nohup
#                 sed -i 's/$es_oom/java.lang.OutOfMemoryError CHECKED:/g' $es_nohup
#                 sed -i 's/$es_diskfull/Not enough CHECKED space/g' $es_nohup
#                 sed -i 's/$es_nospace/No space CHECKED left on device/g' $es_nohup
#                 sed -i 's/$es_null/Exception : java.lang.CHECKED.NullPointerException/g' $es_nohup ; $es_stuplocation restart; $es_mailoom $es_mailto",
#  onlyif => "test `cat $es_nohup | egrep -w '$es_ioe|$es_oom|$es_diskfull|$es_nospace|$es_null'| wc -l` -ge 1",
#} ->

#exec { 'es_lognotreceive' :
#      path => $es_jpath,
#      command => "$es_stuplocation restart; $es_maillog $es_mailto",
#      onlyif => "test sh -x /root/logscript/eslog.sh | wc -l -eq 0",
#}

}
