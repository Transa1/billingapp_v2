FROM eclipse-temurin:17-jdk-alpine
RUN addgroup -S devopsc && adduser -S javams -G devopsc
USER javams:devopsc
ENV JAVA_OPTS=""
ARG JAR_FILE=billing-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} /app.jar
 # use a volume is mor efficient and speed that filesystem
VOLUME /tmp
EXPOSE 8080
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar" ]

