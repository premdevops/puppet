Liqui.postgres.liquibase.path: '/bin/sh /iqs/liquibase/mauth_ss/start_chage.sh'
Liqui.postgres.liquibase.dbname: 'mauth'
Liqui.postgres.liquibase.dbip: '10.4.1.110'
Liqui.postgres.liquibase.setup: 'patch'
Liqui.postgres.liquibase.uname: 'postgres'
Liqui.postgres.liquibase.passwd: 'postgres'