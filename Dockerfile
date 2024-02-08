FROM eclipse-temurin:17-jdk-alpine

docker build . < Dockerfile

COPY target/com/*.jar demo.jar
ENTRYPOINT ["java","-jar","/demo.jar"]
EXPOSE 8080
