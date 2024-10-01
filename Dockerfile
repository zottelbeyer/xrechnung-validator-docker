# Use a alpine base image
FROM alpine:3.20

ADD https://github.com/itplr-kosit/validator-configuration-xrechnung/releases/download/release-2024-06-20/validator-configuration-xrechnung_3.0.2_2024-06-20.zip /tmp/validator-configuration.zip
ADD https://github.com/itplr-kosit/validator/releases/download/v1.5.0/validator-1.5.0-distribution.zip /tmp/validator.zip

# Install OpenJDK 11 and unzip
RUN printf "https://ftp.halifax.rwth-aachen.de/alpine/edge/main\nhttps://ftp.halifax.rwth-aachen.de/alpine/edge/community" > /etc/apk/repositories 
RUN apk --no-cache add unzip openjdk11

# unzip files
RUN unzip /tmp/\*.zip -d /app

# Cleanup
RUN rm -rf /tmp/*.zip

USER 1000:1000

# Set the working directory
WORKDIR /app

# Expose port 8081
EXPOSE 8081

# Set JVM options for memory optimization
ENV JAVA_OPTS="-Xms64m -Xmx256m"

# Set the default command to run the Java application
CMD ["java", "-jar", "validationtool-1.5.0-standalone.jar", "-s", "scenarios.xml", "-r", "/app", "-D", "-H", "0.0.0.0", "-P", "8081"]
