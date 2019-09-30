FROM strimzi/kafka:0.13.0-kafka-2.3.0
USER root:root
ENV JARS_DIR=/opt/kafka/plugins/
ENV CP_VERSION=5.3.1
ADD module_definition /tmp/
ADD scripts/install_libs.sh /tmp/


RUN set -ex; \
  runDeps=''; \
  buildDeps='which curl ca-certificates'; \
  yum -y install $runDeps $buildDeps; \
  \
  MAVEN_VERSION=3.5.0 PATH=$PATH:/opt/maven/bin; \
  mkdir -p /opt/maven; \
  curl -SLs https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -xzf - --strip-components=1 -C /opt/maven; \
  mvn --version; \
  \
  chmod +x /tmp/install_libs.sh; \
  /tmp/install_libs.sh; \
  \
  rm -Rf /opt/src /opt/maven /root/.m2; \
  \
  yum -y clean all

USER 1001

