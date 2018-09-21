#Basic Web
Web Starter for Spring

### Table of Contents
* [Summary](#summary)
* [Requirements](#requirements)
* [Configuration](#configuration)
* [Project contents](#project-contents)
* [Run](#run)

### Summary

The Web Starter in Java provides a starting point for creating web applications running on [Spring](https://spring.io/).

### Configuration
Capabilities are provided through dependencies in the pom.xml file.

### Project contents
The ports are set to the defaults of 8080 for http and 8443 for https and are exposed to the CLI in the cli-config.yml file.

### Run

To build and run the application:
1. `mvn install`
1. `java -jar ./target/JavaSpringBasicKevin-1.0-SNAPSHOT.jar`

To run the application in Docker use the Docker file called `Dockerfile`. If you do not want to install Maven locally you can use `Dockerfile-tools` to build a container with Maven installed.

### Endpoints

The application exposes the following endpoints:
* Health endpoint: `<host>:<port>/health` e.g. http://localhost:8080/health
* Web content: `<host>:<port>`

The ports are set in the pom.xml file and exposed to the CLI in the cli-config.yml file.

### Notices
