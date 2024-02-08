# FROM eclipse-temurin:17-jdk-alpine

# COPY target/*.jar demo.jar
# ENTRYPOINT ["java","-jar","/demo.jar"]
# EXPOSE 8080
# From maven:3.8.5-openjdk-17 AS build
# COPY . .
# # RUN mvn clean package =DskipTests

FROM maven:3.9.2-eclipse-temurin-17-alpine as builder

COPY ./src src/
COPY ./pom.xml pom.xml

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine
COPY --from=builder target/*.jar app.jar
EXPOSE 8080
CMD ["java","-jar","app.jar"]
