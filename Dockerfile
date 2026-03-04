FROM maven:latest as build
WORKDIR /app
COPY pom.xml
COPY src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk
WORKDIR /demo
COPY --from=build /app/target/*.jar petclinic.jar
CMD ["java","-jar","petclinic.jar"]