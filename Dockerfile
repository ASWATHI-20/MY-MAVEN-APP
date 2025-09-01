FROM openjdk:11-jre-slim
VOLUME /tmp
COPY target/my-maven-app.jar my-maven-app.jar
ENTRYPOINT ["java","-jar","/my-maven-app.jar"]