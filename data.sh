#!/bin/sh

# Get aggregated data: https://developer.kontomatik.com/api-doc/#data



sendGetRequest() {
    ARGS="-G -d apiKey=$APIKEY -d ownerExternalId=$1"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/data.xml -s"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 1 ]
    then
        sendGetRequest $@
    else
        echo "Usage: sh data.sh ownerExternalId"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
