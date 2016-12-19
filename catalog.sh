#!/bin/sh

# Download the API commands catalog: https://developer.kontomatik.com/api-doc/#catalog



sendPostRequest() {
    ARGS="-X GET -d apiKey=$APIKEY -d country=pl -d favicons=false"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/catalog.xml -s"
    curl $ARGS
}

if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    sendPostRequest $@
else
    echo "Test apiKey file not found. Aborting..."
fi
