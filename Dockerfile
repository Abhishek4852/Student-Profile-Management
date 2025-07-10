# Use official Tomcat image
FROM tomcat:10.1

# Remove default webapps (optional but clean)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the ROOT webapp
COPY Student.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (default)
EXPOSE 8080


