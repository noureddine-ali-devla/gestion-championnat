# Use an official Tomcat 10 image with Java 17
FROM tomcat:10.1-jdk17-temurin

# Clean default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your project’s WebContent into Tomcat as the ROOT webapp
COPY BasketChampionnat/WebContent/ /usr/local/tomcat/webapps/ROOT/

# Expose the Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
