#!/bin/bash

set -xe

output_dir=workarea

cat << EOF > "${output_dir}/Dockerfile"
FROM gcr.io/distroless/java

MAINTAINER Srinivasa Vasu (svasu@pivotal.io)

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS 

EXPOSE 8070

COPY ./artifacts/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar", "${JAVA_OPTS}", "-Djava.security.egd=file:/dev/./urandom"]

EOF

cp -R ./artifacts "${output_dir}/artifacts"