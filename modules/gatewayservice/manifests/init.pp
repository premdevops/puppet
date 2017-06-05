class gatewayservice {

$gw_service       = hiera('gw.gateway.gatewayservice.service')
$gw_jpath         = hiera('gw.gateway.gatewayservice.jpath')
$gw_source        = hiera('gw.gateway.gatewayservice.source')
$gw_servicename   = hiera('gw.gateway.gatewayservice.servicename')
$gw_dir           = hiera('gw.gateway.gatewayservice.dir')
$gw_zipdir        = hiera('gw.gateway.gatewayservice.zipdir')
$gw_zipfile       = hiera('gw.gateway.gatewayservice.zipfile')
$gw_localsource   = hiera('gw.gateway.gatewayservice.localsource')
$gw_stupscript    = hiera('gw.gateway.gatewayservice.startup_script')
$gw_stuplocation  = hiera('gw.gateway.gatewayservice.startup_location')
$gw_username      = hiera('general.credens.wget.username')
$gw_password      = hiera('general.credens.wget.password')
$gw_mailto        = hiera('routine.monitoring.relevant.mailto')
$gw_ioe           = hiera('routine.monitoring.relevant.ioe')
$gw_oom           = hiera('routine.monitoring.relevant.oom')
$gw_diskfull      = hiera('routine.monitoring.relevant.diskfull')
$gw_nospace       = hiera('routine.monitoring.relevant.nospace')
$gw_null          = hiera('routine.monitoring.relevant.null')
$gw_nohup         = hiera('gw.gateway.gatewayservice.nohup')
$gw_mailoom       = hiera('gw.gateway.gatewayservice.mailoom')
$gw_maillog       = hiera('gw.gateway.gatewayservice.maillog')
$gw_portlog	  = hiera('gw.gateway.gatewayservice.portlog')

wget::fetch { 'GW_download' :
      source      => $gw_source,
      destination => $gw_zipdir,
      user        => $gw_username,
      password    => $gw_password,
      timeout     => 0,
      verbose     => false,
    } ->

exec { 'gw_unzip' :
     path => $gw_jpath,
     cwd => $gw_zipdir,
     command => $gw_zipfile,
} ->

file { $gw_dir :
        ensure => present,
        source => $gw_localsource,
        alias => $gw_servicename,
        recurse => "inf",
        ignore => ["log"],
        purge => "false",
} ->

file { $gw_stuplocation  :
        ensure  => file,
        source => $gw_stupscript,
} ->

service { $gw_service :
        ensure  => running,
        hasstatus => false,
} ->

exec { 'portno_check' :
	path => $gw_jpath,
	command => "$gw_stuplocation restart; $gw_portlog $gw_mailto",
	onlyif => "test `netstat -apn | grep 443 | wc -l` -eq 0",
} ->

exec { 'GW_OOM':
  path => $gw_jpath,
  command =>    "sed -i 's/$gw_ioe/java.io.IOException CHECKED: Map failed/g' $gw_nohup
                 sed -i 's/$gw_oom/java.lang.OutOfMemoryError CHECKED:/g' $gw_nohup
                 sed -i 's/$gw_diskfull/Not enough CHECKED space/g' $gw_nohup
                 sed -i 's/$gw_nospace/No space CHECKED left on device/g' $gw_nohup
                 sed -i 's/$gw_null/Exception : java.lang.CHECKED.NullPointerException/g' $gw_nohup ; $gw_stuplocation restart; $gw_mailoom $gw_mailto",
  onlyif => "test `cat $gw_nohup | egrep -w '$gw_ioe|$gw_oom|$gw_diskfull|$gw_nospace|$gw_null'| wc -l` -ge 1",
} ->

exec { 'gw_lognotreceive' :
      path => $gw_jpath,
      command => "$gw_stuplocation restart; $gw_maillog $gw_mailto",
      onlyif => "test sh -x /root/logscript/gwlog.sh | wc -l -eq 0",
}

}
