FROM jenkins/jenkins:lts-jdk21
USER root
RUN apt-get update && apt-get install -y docker.io
# Keep USER root so Jenkins has permission to access the Docker socket mounted from host
