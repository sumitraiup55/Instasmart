FROM tomcat:9.0
COPY Instasmart.war /usr/local/tomcat/webapps/
EXPOSE 8080
