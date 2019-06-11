FROM stain/jena-fuseki:3.6.0
#note that changing this ^ version number is not enough to update Apache Jena Fuseki, 
#you need to replace the fusek-server, fuseki-server.jar en fuseki-servertrue.jar with 
#the correct updated files.
MAINTAINER Jack Verhoosel <jack.verhoosel@tno.nl>

RUN apk add --update curl


ADD conf/configure.sh /opt/
RUN chmod +x /opt/configure.sh

ADD bin/startup.sh /opt/
RUN chmod +x /opt/startup.sh

ARG INFERENCE_ENABLED

#include a modified fuseki-server.jar where we increased the log level.
ARG TRACE_ENABLED
ADD bin/fuseki-server$TRACE_ENABLED.jar /jena-fuseki/fuseki-server.jar

#the adapted fuseki-server script to load custom libraries.
ADD bin/fuseki-server /jena-fuseki/fuseki-server
RUN chmod +x /jena-fuseki/fuseki-server

RUN mkdir /opt/lib/
ADD lib/* /opt/lib/

#ADD toop-ro-total.ttl /opt/registered-organization.ttl



CMD "/bin/sh" "-c" "sh /opt/startup.sh"
