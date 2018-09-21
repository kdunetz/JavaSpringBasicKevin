FROM ibmjava:8-sdk

COPY target/JavaSpringBasicKevin-1.0-SNAPSHOT.jar /app.jar

ENV JAVA_OPTS=""
EXPOSE 8080
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
