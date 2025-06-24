
# 빌드용 베이스 이미지 (Maven + Java 11)
FROM maven:3.8.5-openjdk-11 AS builder  
                         
# 프로젝트 파일 전체 복사
WORKDIR /app    
COPY . .

# Maven을 사용하여 WAR 파일 생성
RUN mvn clean package -DskipTests

# 실행용 베이스 이미지 (Tomcat + Java 11)
FROM tomcat:9-jdk11         

# 기본으로 제공되는 웹앱을 제거
RUN rm -rf /usr/local/tomcat/webapps/*

# 빌드된 followme.war를 Tomcat ROOT.war로 복사
COPY --from=builder /app/target/followme.war /usr/local/tomcat/webapps/ROOT.war

# 컨테이너 외부에 노출할 포트
EXPOSE 8080
