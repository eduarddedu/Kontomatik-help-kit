#!/bin/sh

# Call ImportTransactionsCommand: https://developer.kontomatik.com/api-doc/#import-transactions-command



sendPostRequest() {
    ARGS="-d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -d iban=$3 -d since=$4 -s"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/import-account-transactions.xml"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 4 ]
    then
        sendPostRequest $@
    else
        echo "Usage: sh import-transactions.sh sessionId sessionIdSignature iban since"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
