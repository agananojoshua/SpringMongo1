FROM eclipse-temurin:17-jdk-alpine
WORKDIR /demo
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
COPY - from=build /demo/target/com/*.jar demo.jar
# COPY target/com/*.jar demo.jar
CMD ["java","-jar","/demo.jar"]
# ENTRYPOINT ["java","-jar","/demo.jar"]
EXPOSE 8080

