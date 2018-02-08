# Semantic Mapping Service

The TOOP Semantic Mapping Service is a specific instantiation of the TNO Plasido platform for ontology-based integration of linked data sources.

It contains 2 specific containers:
- one for the Apache Jena Fuseki triplestore that contains the TOOP Common Semantic Model and its mappings to national data models, and
- one for the GRLC component that provides a REST-API with various GET operations that are translated to SPARQL queries on the Fuseki triplestore  

### How to start the TOOP Semantic Mapping Service
Execute the following steps:

- Make sure you have Docker, Docker Compose and Git installed.
- Git clone this Semantic Mapping Serivce repository to your computer.
- Open a shell and navigate to your `git clone` of the SMS.
- execute the following command: `docker-compose up -d fuseki grlc`
- All SMS services will be started automatically, this might take a while (also when the command is already finished, it might still take a while for all the services to be started).
- Now you can access different services of SMS. In the browser open:

	- Apache Jena Fuseki: `http://localhost:3030`.
	- GRLC: `http://localhost:8001`.
	
Note that we assume your docker host is available on `localhost` (which is the case if you are using Docker for Linux or recent Docker for Windows)

### Configure SMS for your own domain
This sections gives some pointer to what needs to be done to configure SMS for your own domain. Although we strive to make SMS plug-and-play (as in, clone into a particular location and everything sets up automatically), this is currently not the case.

References to the domain of SMS can be found in these locations (please update if we forgot some):

- ./fuseki/ontology-plus-data.ttl
- ./fuseki/configure.sh

