# cat /etc/puppet/modules/liquibase/manifests/init.pp
class liquibase
{
$liquidbversion   = hiera('Liqui.postgres.liquibase.dbversion')
$liquipath        = hiera('Liqui.postgres.liquibase.path')
$liquidbname      = hiera('Liqui.postgres.liquibase.dbname')
$liquidbip        = hiera('Liqui.postgres.liquibase.dbip')
$liquimode        = hiera('Liqui.postgres.liquibase.setup')
$liquiuname       = hiera('Liqui.postgres.liquibase.uname')
$liquipasswd      = hiera('Liqui.postgres.liquibase.passwd')

exec { 'db_ver_changescript':
      command => ["/bin/echo $liquidbversion > /iqs/liquibase/mauth_ss/db.properties"]
  }

exec { 'run_my_script':
command => ["$liquipath $liquidbname $liquidbip $liquimode $liquiuname $liquipasswd"]
#command => ["/bin/sh /iqs/liquibase/liquibase --driver=org.postgresql.Driver --classpath=/iqs/liquibase/postgresql-9.3-1103.jdbc3.jar --url="JDBC:POSTGRESQL://$liquidbip:5432/$liquidbname" --defaultSchemaName="public" --changeLogFile="/iqs/liquibase/mauth_ss/version_changelog_02.xml" --username=$liquiuname --password=$liquipasswd update"]  

}
}  
