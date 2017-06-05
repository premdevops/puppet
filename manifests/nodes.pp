node 'mod6.savanture.in' {
#	include appprereq
#        include iptables
#	include javainstall
#        include gatewayservice
#        include dpprocessservice
#        include esprocessservice
#	include mongodb
        include javaonlineinstall

} 

node 'puptest.savanture.in' {
#	include mongodb
#	include atdmimporterservice
#	include esprocessservice
#	include dpprocessservice
#       include sentryservice
	include artifact
}      

node 'hdfsbastion.iqsystech.com' {
        include liquibase
} 
