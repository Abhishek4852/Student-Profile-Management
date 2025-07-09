# Use official Tomcat 10 image
FROM tomcat:10.1

# Remove default webapps (like examples, docs)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the ROOT of Tomcat
COPY student.war /usr/local/tomcat/webapps/ROOT.war

