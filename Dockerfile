# 1-bosqich: Loyihani yig'ish
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2-bosqich: Botni yurgizish
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
# SQLite bazasi uchun faylni nusxalash
COPY bot_data.db . 

ENTRYPOINT ["java", "-jar", "app.jar"]

