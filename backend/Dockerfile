FROM eclipse-temurin:21-jre-alpine
ENV JAVA_OPTS="-XX:InitialRAMPercentage=50.0 -XX:MaxRAMPercentage=80.0"

WORKDIR /app

COPY target/*.jar app.jar

ENTRYPOINT ["java", "$JAVA_OPTS", "-jar", "app.jar"]