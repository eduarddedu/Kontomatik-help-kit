#!/bin/sh

# Call ImportOwnersCommand: https://developer.kontomatik.com/api-doc/#sign-out-command



sendPostRequest() {
    ARGS="-d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/sign-out.xml"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 2 ]
    then
        sendPostRequest $@
    else
        echo "Usage: sh sign-out.sh sessionId sessionIdSignature"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi

