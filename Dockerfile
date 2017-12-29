FROM amazonlinux:latest
MAINTAINER "Shalabh Kumar"

RUN yum install -y python27 shadow-utils
RUN curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py --user

ENV PATH="/root/.local/bin/:${PATH}:."

RUN pip install awscli

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar http://jenkins.ctsawslab.com:8080/jnlpJars/agent.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

COPY jenkins-slave /usr/local/bin/jenkins-slave

RUN useradd -m -u 1000 jenkins

RUN chmod a+rwx /home/jenkins
WORKDIR /home/jenkins
USER jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-slave"]