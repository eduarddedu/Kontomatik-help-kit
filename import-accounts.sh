#!/bin/sh

# Call ImportAccountsCommand: https://developer.kontomatik.com/api-doc/#import-accounts-command



sendPostRequest() {
    ARGS="-d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -s"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/import-accounts.xml"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 2 ]
    then
        sendPostRequest $@
    else
        echo "Usage: sh import-accounts.sh sessionId sessionIdSignature"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
