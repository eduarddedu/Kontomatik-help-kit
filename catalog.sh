#!/bin/sh

# Download the API commands catalog: https://developer.kontomatik.com/api-doc/#catalog



sendGetRequest() {
    ARGS="-X GET -d apiKey=$APIKEY -d country=pl -d favicons=false"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command-catalog.xml -s"
    curl $ARGS
}

if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    sendGetRequest $@
else
    echo "Test apiKey file not found. Aborting..."
fi
