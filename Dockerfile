# Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Install Maven and build the project
RUN apt-get update && apt-get install -y maven && mvn clean package

# Copy the built jar
COPY target/*.jar app.jar

# Expose port (Render assigns dynamic port)
ENV PORT 8080
EXPOSE $PORT

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
