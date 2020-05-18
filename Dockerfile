#### Stage 1: Build the application.properties
FROM openjdk:8-jdk-alpine

# Copy jar files to the image
ARG JAR_FILE=out/artifacts/gloreactdashboard_jar/*
COPY ${JAR_FILE} /home/gloreactdashboard/
ARG CONFIG_FILE=out/artifacts/gloreactdashboard_jar/config/application.properties
COPY ${CONFIG_FILE} /home/gloreactdashboard/config/

# Set the current working directory inside the image
WORKDIR /home/gloreactdashboard/

# Create user that will run the application.properties
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
# Use root to create folder in image & give new user rights
USER root
RUN chown -R spring /home/gloreactdashboard/

ENTRYPOINT ["java","-jar","/home/gloreactdashboard/gloreactdashboard.jar","--spring.config.location=config/application.properties"]