# Use official Tomcat 10 with Java 17
FROM tomcat:10.1-jdk17-temurin

# Disable Tomcat shutdown port to stop Render health-check warnings
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Remove default example webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Create directory for compiled classes
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Copy and compile Java source files, linking against Tomcat's Jakarta Servlet API
COPY BasketChampionnat/src/ /tmp/src/
RUN javac -encoding UTF-8 \
    -classpath /usr/local/tomcat/lib/jakarta.servlet-api.jar \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    $(find /tmp/src -name "*.java")

# Copy JSPs, web.xml, CSS, images, etc. into ROOT webapp
COPY BasketChampionnat/WebContent/ /usr/local/tomcat/webapps/ROOT/

# Expose default Tomcat HTTP port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

