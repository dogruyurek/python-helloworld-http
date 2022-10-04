#!/bin/bash

docker volume create jenkins-data
docker volume create jenkins-log

mkdir docker

cat <<'EOF' >> docker/dockerfile

FROM jenkins/jenkins
LABEL maintainer="cr@pnsi"
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
 
ENV JAVA_OPTS="-Xmx2048m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"

EOF

cd docker

docker build -t myjenkins .

docker run -p 8080:8080 -p 50000:50000 --name=jenkins-master --network host -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker --mount source=jenkins-log,target=/var/log/jenkins --mount source=jenkins-data,target=/var/jenkins_home --user $(id -u):$(id -g) -d myjenkins
echo "Jenkins is starting"
sleep 15
echo "Initial admin password"
cat /var/lib/docker/volumes/jenkins-data/_data/secrets/initialAdminPassword

echo "Open your browser and complete jenkins setup"
