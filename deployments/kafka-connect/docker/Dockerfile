FROM solsson/kafka:2.2.0
# referenced from dependency versions in the maven pom
ENV CP_VERSION=5.2.1

ADD pom-kafka-connect-jdbc.xml pom-avro-converter.xml pom-registry-client.xml /tmp/

# avoid patching kafka-run-class.sh, by hijacking one of the unused paths where it globs for jars
ENV JARS_DIR=/usr/share/java/kafka

RUN set -ex; \
  export DEBIAN_FRONTEND=noninteractive; \
  runDeps=''; \
  buildDeps='curl ca-certificates'; \
  /usr/bin/apt-get update && apt-get install -y $runDeps $buildDeps --no-install-recommends; \
  \
  MAVEN_VERSION=3.5.0 PATH=$PATH:/opt/maven/bin; \
  mkdir -p /opt/maven; \
  curl -SLs https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -xzf - --strip-components=1 -C /opt/maven; \
  mvn --version; \
  \
  mkdir -p $JARS_DIR/kafka-connect-jdbc $JARS_DIR/avro-converter $JARS_DIR/registry-client; \
  mvn -f /tmp/pom-kafka-connect-jdbc.xml dependency:copy-dependencies -DincludeScope=runtime -DoutputDirectory=$JARS_DIR/kafka-connect-jdbc; \
  mvn -f /tmp/pom-avro-converter.xml dependency:copy-dependencies -DincludeScope=runtime -DoutputDirectory=$JARS_DIR/avro-converter; \
  mvn -f /tmp/pom-registry-client.xml dependency:copy-dependencies -DincludeScope=runtime -DoutputDirectory=$JARS_DIR/registry-client; \
  \
  rm -Rf /opt/src /opt/maven /root/.m2; \
  \
  /usr/bin/apt-get purge -y --auto-remove $buildDeps; \
  rm -rf /var/lib/apt/lists/*; \
  rm -rf /var/log/dpkg.log /var/log/alternatives.log /var/log/apt

ENTRYPOINT ["./bin/connect-distributed.sh"]


