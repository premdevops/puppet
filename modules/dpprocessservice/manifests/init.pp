class dpprocessservice {

$dp_service       = hiera('dp.dpprocess.dpprocessservice.service')
$dp_jpath         = hiera('dp.dpprocess.dpprocessservice.jpath')
$dp_source        = hiera('dp.dpprocess.dpprocessservice.source')
$dp_servicename   = hiera('dp.dpprocess.dpprocessservice.servicename')
$dp_dir           = hiera('dp.dpprocess.dpprocessservice.dir')
$dp_zipdir        = hiera('dp.dpprocess.dpprocessservice.zipdir')
$dp_zipfile       = hiera('dp.dpprocess.dpprocessservice.zipfile')
$dp_localsource   = hiera('dp.dpprocess.dpprocessservice.localsource')
$dp_stupscript    = hiera('dp.dpprocess.dpprocessservice.startup_script')
$dp_stuplocation  = hiera('dp.dpprocess.dpprocessservice.startup_location')
$dp_username      = hiera('general.credens.wget.username')
$dp_password      = hiera('general.credens.wget.password')
$dp_mailto        = hiera('routine.monitoring.relevant.mailto')
$dp_ioe           = hiera('routine.monitoring.relevant.ioe')
$dp_oom           = hiera('routine.monitoring.relevant.oom')
$dp_diskfull      = hiera('routine.monitoring.relevant.diskfull')
$dp_nospace       = hiera('routine.monitoring.relevant.nospace')
$dp_null          = hiera('routine.monitoring.relevant.null')
$dp_nohup         = hiera('dp.dpprocess.dpprocessservice.nohup')
$dp_mailoom       = hiera('dp.dpprocess.dpprocessservice.mailoom')
$dp_maillog       = hiera('dp.dpprocess.dpprocessservice.maillog')

wget::fetch { 'dp_download' :
      source      => $dp_source,
      destination => $dp_zipdir,
      user        => $dp_username,
      password    => $dp_password,
      timeout     => 0,
      verbose     => false,
    } ->

exec { 'dp_unzip' :
     path => $dp_jpath,
     cwd => $dp_zipdir,
     command => $dp_zipfile,
} ->

file { $dp_dir :
        ensure => present,
        source => $dp_localsource,
        alias => $dp_servicename,
        recurse => "inf",
        ignore => ["log"],
        purge => "false",
} ->

file { $dp_stuplocation  :
        ensure  => file,
        source => $dp_stupscript,
} ->

service { $dp_service :
        ensure  => running,
        hasstatus => false,
} ->

exec { 'dp_OOM':
  path => $dp_jpath,
  command =>    "sed -i 's/$dp_ioe/java.io.IOException CHECKED: Map failed/g' $dp_nohup
                 sed -i 's/$dp_oom/java.lang.OutOfMemoryError CHECKED:/g' $dp_nohup
                 sed -i 's/$dp_diskfull/Not enough CHECKED space/g' $dp_nohup
                 sed -i 's/$dp_nospace/No space CHECKED left on device/g' $dp_nohup
                 sed -i 's/$dp_null/Exception : java.lang.CHECKED.NullPointerException/g' $dp_nohup ; $dp_stuplocation restart; $dp_mailoom $dp_mailto",
  onlyif => "test `cat $dp_nohup | egrep -w '$dp_ioe|$dp_oom|$dp_diskfull|$dp_nospace|$dp_null'| wc -l` -ge 1",
} ->

exec { 'dp_lognotreceive' :
      path => $dp_jpath,
      command => "$dp_stuplocation restart; $dp_maillog $dp_mailto",
      onlyif => "test sh -x /root/logscript/dplog.sh | wc -l -eq 0",
}

}
