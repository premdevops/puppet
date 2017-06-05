class artifact {

class {'artifactory':
  url => 'http://10.4.1.120:8081',
}

artifactory::artifact {'GatewayServer':
  gav        => 'com.savanture:GatewayServer:3.4.0.2',
  repository => 'app-release-local',
  output     => '/iqs/GatewayServer/GatewayServer.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'antlr4-runtime':
  gav        => 'org.antlr:antlr4-runtime:4.1',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/antlr4-runtime-4.1.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'SNMPDeviceMonitoringServer':
  gav        => 'com.secureiq:SNMPDeviceMonitoringServer:1.0.0',
  repository => ' libs-release-local',
  output     => '/iqs/GatewayServer/lib/SNMPDeviceMonitoringServer-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'apache-log4j-extras':
  gav        => ' log4j:apache-log4j-extras:1.0',
  repository => 'repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/apache-log4j-extras-1.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'ATDMJDBCDriver':
  gav        => 'com.secureiq:ATDMJDBCDriver:1.0.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/ATDMJDBCDriver-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'bonecp':
  gav        => 'com.jolbox:bonecp:0.7.1.RELEASE',
  repository => ' repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/bonecp-0.7.1.RELEASE.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'cglib-nodep':
  gav        => 'cglib:cglib-nodep:3.1',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/cglib-nodep-3.1.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'commons-dbcp':
  gav        => 'commons-dbcp:commons-dbcp:1.4',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/commons-dbcp-1.4.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'commons-io':
  gav        => 'commons-io:commons-io:2.4',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/commons-io-2.4.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'commons-lang':
  gav        => 'commons-lang:commons-lang:2.6',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/commons-lang-2.6.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'commons-logging':
  gav        => 'commons-logging:commons-logging:1.2',
  repository => 'repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/commons-logging-1.2.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'commons-net':
  gav        => 'commons-net:commons-net:3.0.1',
  repository => 'repo-org-maven2',
  output     => '/iqs/GatewayServer/lib/commons-net-3.0.1.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'commons-pool':
  gav        => 'commons-pool:commons-pool:1.5.6',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/commons-pool-1.5.6.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'ConnectionPooler':
  gav        => 'com.iqs:ConnectionPooler:1.0.1',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/ConnectionPooler-1.0.1.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'esper':
  gav        => 'com.espertech:esper:5.4.0',
  repository => 'repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/esper-5.4.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'esperio-db':
  gav        => 'com.espertech:esperio-db:5.4.0',
  repository => ' repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/esperio-db-5.4.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'ForwardQ':
  gav        => 'com.iqs:ForwardQ:1.0.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/ForwardQ-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'guava':
  gav        => 'com.google.guava:guava:11.0.2',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/guava-11.0.2.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'HeartBeatServer':
  gav        => 'com.secureiq:HeartBeatServer:1.0.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/HeartBeatServer-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'IPLocationModuleLibrary':
  gav        => 'com.secureiq:IPLocationModuleLibrary:1.1.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/IPLocationModuleLibrary-1.1.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'jdom':
  gav        => 'jdom:jdom:1.0',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/jdom-1.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'jsoup':
  gav        => 'org.jsoup:jsoup:1.7.1',
  repository => 'repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/jsoup-1.7.1.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'log4j':
  gav        => 'log4j:log4j:1.2.17',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/log4j-1.2.17.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'mailapi':
  gav        => 'javax.mail:mailapi:1.4.3',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/mailapi-1.4.3.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'mongo-java-driver':
  gav        => 'org.mongodb:mongo-java-driver:2.12.4',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/mongo-java-driver-2.12.4.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'NessusServer':
  gav        => 'com.secureiq:NessusServer:1.0.1',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/NessusServer-1.0.1.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'netty-all':
  gav        => 'io.netty:netty-all:4.1.3.Final',
  repository => 'repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/netty-all-4.1.3.Final.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'NGNClient':
  gav        => 'com.secureiq:NGNClient:3.1.0',
  repository => ' libs-release-local',
  output     => '/iqs/GatewayServer/lib/NGNClient-3.1.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'NGNServer':
  gav        => 'com.secureiq:NGNServer:3.1.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/NGNServer-3.1.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'OpenvasServer':
  gav        => 'com.secureiq:OpenvasServer:1.0.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/OpenvasServer-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'org.xbill.dns':
  gav        => 'org.xbill.dns:org.xbill.dns:2.1.5',
  repository => 'ext-release-local',
  output     => '/iqs/GatewayServer/lib/org.xbill.dns-2.1.5.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'postgresql':
  gav        => 'org.postgresql:postgresql:9.3-1104-jdbc4',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/postgresql-9.3-1104-jdbc4.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'sentinelphoningServer':
  gav        => 'com.secureiq:sentinelphoningServer:1.0.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/sentinelphoningServer-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'SentryUpdateServer':
  gav        => 'com.iqs:SentryUpdateServer:1.0.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/SentryUpdateServer-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'ServiceCache':
  gav        => ' com.secureiq:ServiceCache:1.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/ServiceCache-1.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'SIQPersistence':
  gav        => 'SIQPersistence:SIQPersistence:1.0.0',
  repository => 'libs-release-local',
  output     => '/iqs/GatewayServer/lib/SIQPersistence-1.0.0.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'slf4j-api':
  gav        => 'org.slf4j:slf4j-api:1.7.5',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/slf4j-api-1.7.5.jar',
  timestamped => true,
  ensure     => present
}
artifactory::artifact {'slf4j-log4j12':
  gav        => 'org.slf4j:slf4j-log4j12:1.7.5',
  repository => 'repo1-cache',
  output     => '/iqs/GatewayServer/lib/slf4j-log4j12-1.7.5.jar',
  timestamped => true,
  ensure     => present
}

artifactory::artifact {'smtp':
  gav        => 'com.sun.mail:smtp:1.4.5',
  repository => 'repo-org-maven2-cache',
  output     => '/iqs/GatewayServer/lib/smtp-1.4.5.jar',
  timestamped => true,
  ensure     => present
}


artifactory::artifact {'yamlbeans':
  gav        => 'com.esotericsoftware:yamlbeans:1.05',
  repository => 'ext-release-local',
  output     => '/iqs/GatewayServer/lib/yamlbeans-1.05.jar',
  timestamped => true,
  ensure     => present
}

}
