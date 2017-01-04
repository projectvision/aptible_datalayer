FROM tomcat:8-jre8
MAINTAINER Varun Gupta vxg@projectvisionhealth.com
# Remove unneeded apps
RUN rm -rf /usr/local/tomcat/webapps/examples
RUN rm -rf /usr/local/tomcat/webapps/docs
RUN rm -rf /usr/local/tomcat/webapps/manager

RUN apt-get update -y
RUN apt-get install -y vim

#Copy the datalayer webapp folder to correct location.
COPY datalayer /usr/local/tomcat/webapps/datalayer
# replaced with a bash file
# COPY datalayerOverride.properties /usr/local/tomcat/webapps/datalayer/WEB-INF/classes/
RUN rm -f /usr/local/tomcat/webapps/mainlayer/WEB-INF/classes/log4j2.xml

COPY log4j2.xml /usr/local/tomcat/webapps/datalayer/WEB-INF/classes/

COPY env.sh /usr/bin/