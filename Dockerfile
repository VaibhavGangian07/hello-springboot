# Use Java 17 image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Install Maven and build the project
RUN apt-get update && apt-get install -y maven && mvn clean package

# The jar will be in target/ after build
# Find it and rename to app.jar
RUN cp target/*.jar app.jar

# Expose port (Render uses $PORT)
ENV PORT 8080
EXPOSE $PORT

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
