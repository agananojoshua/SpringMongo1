FROM eclipse-temurin:17-jdk-alpine

COPY target/com/example/demo-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080
