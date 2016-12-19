#!/bin/sh

# Call ImportCreditCardTransactionsCommand: https://developer.kontomatik.com/api-doc/#import-credit-card-transactions-command



sendPostRequest() {
    ARGS="-d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -d since=2017-01-01 -d cardNumber=$3 -s"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/import-credit-card-transactions.xml"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 2 ]
    then
        sendPostRequest $@
    else
        echo "Usage: sh import-credit-card-transactions.sh sessionId sessionIdSignature cardNumber"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
