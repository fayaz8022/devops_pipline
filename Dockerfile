FROM  tomcat
EXPOSE 8086
COPY  /target/pipeline-0.0.1-SNAPSHOT.war /demo.war
CMD ["java","-jar", "/demo.war"]
