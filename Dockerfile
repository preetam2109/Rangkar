# Use the official Maven image to build the JAR
FROM maven:3.9.6-eclipse-temurin-19 AS build
WORKDIR /app

# Copy project files and build
COPY . .
RUN mvn clean package

# Use a smaller JDK image to run the JAR
FROM openjdk:19-slim
WORKDIR /app

# Copy the built JAR from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
EXPOSE 9090
