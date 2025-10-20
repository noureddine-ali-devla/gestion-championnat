# Use official Tomcat 10 image with Java 17
FROM tomcat:10.1-jdk17-temurin

# Disable the Tomcat shutdown port (avoids Render health-check warnings)
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Create directory for compiled classes
RUN mkdir -p /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Copy and compile Java source files into WEB-INF/classes
COPY BasketChampionnat/src/ /tmp/src/
RUN javac -encoding UTF-8 -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes $(find /tmp/src -name "*.java")

# Copy all JSPs, assets, and web.xml into Tomcat ROOT webapp
COPY BasketChampionnat/WebContent/ /usr/local/tomcat/webapps/ROOT/

# Expose Tomcat HTTP port
EXPOSE 8080

# Launch Tomcat
CMD ["catalina.sh", "run"]
