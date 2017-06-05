#include oracle_java

class javaonlineinstall {

java::oracle { 'jdk7' :
  ensure  => 'present',
  version => '7',
  java_se => 'jdk',

}
}
