#### Stage 1: Build the application.properties
FROM openjdk:8-jdk-alpine

# Copy jar files to the image
ARG JAR_FILE=target/jenkinsdocker-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} /home/jenkinsdocker/
ARG CONFIG_FILE=target/classes/application.properties
COPY ${CONFIG_FILE} /home/jenkinsdocker/config/

# Set the current working directory inside the image
WORKDIR /home/jenkinsdocker/

# Create user that will run the application.properties
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
# Use root to create folder in image & give new user rights
USER root
RUN chown -R spring /home/jenkinsdocker/

ENTRYPOINT ["java","-jar","/home/jenkinsdocker/jenkinsdocker-0.0.1-SNAPSHOT.jar","--spring.config.location=config/application.properties"]