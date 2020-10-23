FROM openjdk:7
MAINTAINER Helias B

# Execute system update
RUN apt-get -y update && \
    apt-get -y install pwgen \
    wget \
    xmlstarlet \
    bsdtar \
    unzip && \
    apt-get clean all

# Create a user and group used to launch processes
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)
RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss

# Set the working directory to jboss' user home directory

#ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
#ENV JBOSS_HOME /opt/jboss/jboss-as-7.1.1.Final

#Get JBoss 7.1.1 from Jboss.org and unzip it

RUN wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.zip -P /tmp
WORKDIR /opt/jboss
RUN unzip /tmp/jboss-as-7.1.1.Final.zip && \
    rm -rf /opt/jboss/jboss-as-7.1.1.Final/jboss-modules.jar
COPY jboss-modules-1.1.5.GA.jar \
     JbossWindowsToDocker/jboss/* \
     /opt/jboss/jboss-as-7.1.1.Final/

# Expose the ports we're interested in, 8080 for webinterface and 9990 for Admin Console.
EXPOSE 8080 9990 

# Set the default command to run on boot
# # This will boot JBoss in the standalone mode and bind to all interface

ENTRYPOINT ["entrypoint.sh"]
CMD ["/opt/jboss/jboss-as-7.1.1.Final/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement 0.0.0.0"]

