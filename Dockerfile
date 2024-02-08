FROM eclipse-temurin:17-jdk-alpine

COPY target/*.jar demo.jar
ENTRYPOINT ["java","-jar","/demo.jar"]
EXPOSE 8080

