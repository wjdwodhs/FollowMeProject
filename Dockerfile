
FROM maven:3.8.5-openjdk-11 AS builder                        
WORKDIR /app    
COPY . .
RUN mvn clean package -DskipTests

FROM tomcat:9-jdk11         
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/followme.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080