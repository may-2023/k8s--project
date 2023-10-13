# Use the OpenJDK 8 Alpine Linux image as the base image
FROM openjdk:8-alpine

# Update the package index and install /bin/sh
RUN apk update && apk add bash

# Create the project directory
RUN mkdir -p /opt/app

# Set the environment variable for the project home directory
ENV PROJECT_HOME /opt/app

# Copy the Spring Boot application JAR to the project directory in the image
COPY target/spring-boot-mongo-1.0.jar $PROJECT_HOME/spring-boot-mongo.jar

# Set the working directory to the project directory
WORKDIR $PROJECT_HOME

# Define the command to run the Spring Boot application
CMD ["java", "-Dspring.data.mongodb.uri=mongodb://mongo:27017/spring-mongo", "-Djava.security.egd=file:/dev/./urandom", "-jar", "spring-boot-mongo.jar"]
