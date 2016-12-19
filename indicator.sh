#!/bin/sh

# Call FinancialHealthIndicator: https://developer.kontomatik.com/api-doc/#financial-health-indicator



sendGetRequest() {
    ARGS="-G -d apiKey=$APIKEY -d ownerExternalId=$1 -s"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/indicator.xml"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 1 ]
    then
        sendGetRequest $@
    else
        echo "Usage: sh indicator.sh ownerExternalId"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
