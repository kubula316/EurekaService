FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/EurekaService-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8761
ENTRYPOINT ["java", "-jar","EurekaService.jar"]