#!/bin/sh

# Poll the command status: https://developer.kontomatik.com/api-doc/#command-status



sendGetRequest() {
    ARGS="-G -d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -s"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/$3.xml"
    curl $ARGS
}

if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 3 ]
    then
        sendGetRequest $@
    else
        echo "Usage: sh poll.sh sessionId sessionIdSignature commandId"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
