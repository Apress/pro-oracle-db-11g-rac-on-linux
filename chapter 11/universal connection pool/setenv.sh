set -x
export JAVA_HOME=/opt/jdk1.6.0_20
export CATALINA_HOME=/opt/apache-tomcat-6.0.26
export ANT_HOME=/opt/apache-ant-1.8.0

export PATH=$CATALINA_HOME/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$PATH

set +x

redeploy() {
	ant remove
	ant install
}

