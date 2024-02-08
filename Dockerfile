FROM eclipse-temurin:17-jdk-alpine

COPY target/com/*.jar demo.jar
COPY --chown=user:user target/**.jar /home/user/demo.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080
