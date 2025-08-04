FROM tomcat:9.0

# Remove default ROOT directory if exists
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file as ROOT.war for root context
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

# Start Tomcat in the foreground
CMD ["catalina.sh", "run"]
