# Use an official OpenJDK runtime as a parent image
FROM openjdk:22-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY ./pom.xml ./pom.xml
COPY ./mvnw ./mvnw
COPY ./.mvn ./.mvn

# Resolve dependencies
RUN ./mvnw dependency:resolve

# Copy the project source code
COPY ./src ./src

# Package the application (using Maven)
RUN ./mvnw package

# Expose port 8080
EXPOSE 8080

# Command to run the app
CMD ["java", "-jar", "target/chat-0.0.1-SNAPSHOT.jar"]
