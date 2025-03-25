# Use OpenJDK 19 as the base image
FROM openjdk:19-slim

# Copy the JAR file from the "target" folder to the container
COPY target/*.jar app.jar

# Set the command to run the application
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Expose port 9090 (or the port your app uses)
EXPOSE 9090
