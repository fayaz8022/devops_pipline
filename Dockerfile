FROM  tomcat
EXPOSE 8086
COPY  /target/pipeline-0.0.1-SNAPSHOT.war /demo.jar
CMD ["java","-jar", "/demo.jar"]
