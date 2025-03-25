
FROM openjdk:19-slim


COPY target/*.jar app.jar


ENTRYPOINT ["java", "-jar", "/app.jar"]


EXPOSE 9090
