# Stage 1: build
FROM maven:3.9.6-eclipse-temurin-11 AS builder
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: runtime
FROM tomcat:9.0-jre11-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=builder /build/target/*.war /usr/local/tomcat/webapps/ROOT.war

RUN groupadd -r appgroup && useradd -r -g appgroup appuser \
    && chown -R appuser:appgroup /usr/local/tomcat

USER appuser

EXPOSE 8080

CMD ["catalina.sh", "run"]