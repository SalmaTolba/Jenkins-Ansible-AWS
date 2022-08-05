# in this image we will add docker client
FROM jenkins/jenkins:lts
USER root

# install docker client
RUN apt update
RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update
RUN apt-cache policy docker-ce
RUN apt install -y docker-ce
RUN usermod -aG docker jenkins

# to run container : docker run -d -p 8083:8080 -v /var/run/docker.sock:/var/run/docker.sock <image-name>