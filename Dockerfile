# FROM eclipse-temurin:17-jdk-alpine

# COPY target/*.jar demo.jar
# ENTRYPOINT ["java","-jar","/demo.jar"]
# EXPOSE 8080
# From maven:3.8.5-openjdk-17 AS build
# COPY . .
# # RUN mvn clean package =DskipTests

# FROM openjdk:17.0.1-jdk-slim
# COPY target/demo-0.0.1-SNAPSHOT.jar demo.jar
# # COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
# EXPOSE 8080
# ENTRYPOINT ["java","-jar","demo.jar"]


#
# Build stage
#
# FROM eclipse-temurin:17-jdk-jammy AS build
# ENV HOME=/usr/app
# RUN mkdir -p $HOME
# WORKDIR $HOME
# ADD . $HOME
# RUN --mount=type=cache,target=/root/.m2 ./mvnw -f $HOME/pom.xml clean package

#
# Package stage
#
FROM eclipse-temurin:17-jre-jammy 
# ARG JAR_FILE=/usr/app/target/*.jar
COPY --from=build =/usr/app/target/*.jarE /app/runner.jar
EXPOSE 8080
ENTRYPOINT java -jar /app/runner.jar
