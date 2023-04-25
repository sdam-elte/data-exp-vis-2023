#!/bin/bash
echo "You can check the result under https://k8plex-edu.elte.hu/${NB_TESTURL}"

NUMEXPR_MAX_THREADS=1
echo "API URL is at https://${SERVERNAME}/${REPORT_URL}"

if [ -z "$REPORT_DIR" ]; then
        REPORT_DIR="./"
        echo "serving report from $REPORT_DIR"
fi


cd $REPORT_DIR

INDEX_FILE=$1
if [ -z $1 ]; then
   INDEX_FILE="./"
fi

### report url
        /opt/conda/bin/bokeh serve  $INDEX_FILE --prefix ${REPORT_URL} --allow-websocket-origin ${SERVERNAME} --port $REPORT_PORT
