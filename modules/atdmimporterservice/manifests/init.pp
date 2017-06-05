class atdmimporterservice {

$atdm_service       = hiera('atdm.atdmprocess.atdmimporterservice.service')
$atdm_jpath         = hiera('atdm.atdmprocess.atdmimporterservice.jpath')
$atdm_source        = hiera('atdm.atdmprocess.atdmimporterservice.source')
$atdm_servicename   = hiera('atdm.atdmprocess.atdmimporterservice.servicename')
$atdm_dir           = hiera('atdm.atdmprocess.atdmimporterservice.dir')
$atdm_zipdir        = hiera('atdm.atdmprocess.atdmimporterservice.zipdir')
$atdm_zipfile       = hiera('atdm.atdmprocess.atdmimporterservice.zipfile')
$atdm_localsource   = hiera('atdm.atdmprocess.atdmimporterservice.localsource')
$atdm_stupscript    = hiera('atdm.atdmprocess.atdmimporterservice.startup_script')
$atdm_stuplocation  = hiera('atdm.atdmprocess.atdmimporterservice.startup_location')
$atdm_username      = hiera('general.credens.wget.username')
$atdm_password      = hiera('general.credens.wget.password')
$atdm_mailto        = hiera('routine.monitoring.relevant.mailto')
$atdm_ioe           = hiera('routine.monitoring.relevant.ioe')
$atdm_oom           = hiera('routine.monitoring.relevant.oom')
$atdm_diskfull      = hiera('routine.monitoring.relevant.diskfull')
$atdm_nospace       = hiera('routine.monitoring.relevant.nospace')
$atdm_null          = hiera('routine.monitoring.relevant.null')
$atdm_nohup         = hiera('atdm.atdmprocess.atdmimporterservice.nohup')
$atdm_mailoom       = hiera('atdm.atdmprocess.atdmimporterservice.mailoom')
$atdm_maillog       = hiera('atdm.atdmprocess.atdmimporterservice.maillog')

wget::fetch { 'ATDM_download' :
      source      => $atdm_source,
      destination => $atdm_zipdir,
      user        => $atdm_username,
      password    => $atdm_password,
      timeout     => 0,
      verbose     => false,
    } ->

exec { 'atdm_unzip' :
     path => $atdm_jpath,
     cwd => $atdm_zipdir,
     command => $atdm_zipfile,
} ->

file { $atdm_dir :
        ensure => present,
        source => $atdm_localsource,
        alias => $atdm_servicename,
        recurse => "inf",
        ignore => ["log"],
        purge => "false",
} ->

file { $atdm_stuplocation  :
        ensure  => file,
        source => $atdm_stupscript,
} ->

service { $atdm_service :
        ensure  => running,
        hasstatus => false,
} ->

exec { 'atdm_OOM':
  path => $atdm_jpath,
  command =>    "sed -i 's/$atdm_ioe/java.io.IOException CHECKED: Map failed/g' $atdm_nohup
                 sed -i 's/$atdm_oom/java.lang.OutOfMemoryError CHECKED:/g' $atdm_nohup
                 sed -i 's/$atdm_diskfull/Not enough CHECKED space/g' $atdm_nohup
                 sed -i 's/$atdm_nospace/No space CHECKED left on device/g' $atdm_nohup
                 sed -i 's/$atdm_null/Exception : java.lang.CHECKED.NullPointerException/g' $atdm_nohup ; $atdm_stuplocation ratdmtart; $atdm_mailoom $atdm_mailto",
  onlyif => "test `cat $atdm_nohup | egrep -w '$atdm_ioe|$atdm_oom|$atdm_diskfull|$atdm_nospace|$atdm_null'| wc -l` -ge 1",
} ->

exec { 'atdm_lognotreceive' :
      path => $atdm_jpath,
      command => "$atdm_stuplocation restart; $atdm_maillog $atdm_mailto",
      onlyif => "test sh -x /root/logscript/atdmlog.sh | wc -l -eq 0",
}

}
