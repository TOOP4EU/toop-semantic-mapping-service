FROM stain/jena-fuseki:3.4.0
#note that changing this ^ version number is not enough to update Apache Jena Fuseki, 
#you need to replace the fusek-server, fuseki-server.jar en fuseki-servertrue.jar with 
#the correct updated files.
MAINTAINER Jack Verhoosel <jack.verhoosel@tno.nl>

RUN apk add --update curl

ADD configure.sh /opt/
RUN chmod +x /opt/configure.sh
ADD startup.sh /opt/
RUN chmod +x /opt/startup.sh

ARG INFERENCE_ENABLED
ADD pizza-config$INFERENCE_ENABLED.ttl /fuseki/configuration/pizza-config.ttl
ADD ontology-plus-data.ttl /opt/

#include a modified fuseki-server.jar where we increased the log level.
ARG TRACE_ENABLED
ADD fuseki-server$TRACE_ENABLED.jar /jena-fuseki/fuseki-server.jar
ADD fuseki-server /jena-fuseki/
RUN chmod +x /jena-fuseki/fuseki-server

ADD openllet-core-2.6.3-SNAPSHOT.jar /opt/
ADD openllet-query-2.6.3-SNAPSHOT.jar /opt/
ADD openllet-jena-2.6.3-SNAPSHOT.jar /opt/
ADD openllet-functions-2.6.3-SNAPSHOT.jar /opt/
ADD jgrapht-ext-1.0.1.jar /opt/
ADD jgraph-5.13.0.0.jar /opt/
ADD jgrapht-core-1.0.1.jar /opt/
ADD jgraphx-2.0.0.1.jar /opt/

ADD data.ttl /opt/
ADD ro-total-export.ttl /opt/registered-organization.ttl

CMD "/bin/sh" "-c" "sh /opt/startup.sh"