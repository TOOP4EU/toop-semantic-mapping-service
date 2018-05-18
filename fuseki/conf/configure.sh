#!/bin/bash

#Wait for the server has been started.
done=""
while [ "$done" != "200" ]
do
        echo "Waiting for fuseki to start..."
        done=$(curl --write-out %{http_code} --silent --output /dev/null -X GET http://127.0.0.1:3030/)
        sleep 3
done

# configuration curl commands
echo "Now deploying required datasets through CURL..."

curl -u admin:admin 'http://fuseki:3030/$/datasets' --data 'dbName=TOOP&dbType=tdb' --compressed
curl -u admin:admin 'http://fuseki:3030/TOOP/data'  -F "files[]=@/opt/registered-organization.ttl" --compressed
