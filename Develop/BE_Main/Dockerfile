FROM azul/zulu-openjdk:8u192-8.33.0.1
ARG JAR_FILE="build/libs/ssafytime-*-SNAPSHOT.jar"
COPY ${JAR_FILE} build.jar
ENTRYPOINT ["java","-jar","build.jar"]