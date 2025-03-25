# Stage 1: Build the JAR
FROM maven:3.9.6 AS build
WORKDIR /app

# Copy your project files to the container
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the JAR on a minimal image
FROM openjdk:19-slim
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Set the command to run your application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
EXPOSE 9090
