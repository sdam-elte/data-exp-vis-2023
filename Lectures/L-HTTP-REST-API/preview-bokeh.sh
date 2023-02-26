#!/bin/bash
echo "You can check the result under https://k8plex-edu.elte.hu/${NB_TESTURL}"

NUMEXPR_MAX_THREADS=1

if [ -z "$REPORT_PORT" ]; then
        REPORT_PORT=9000
        echo "serving report on $REPORT_PORT"
fi
if [ -z "$REPORT_DIR" ]; then
        REPORT_DIR="./"
        echo "serving report from $REPORT_DIR"
fi

REPORT_PORT=9000

cd $REPORT_DIR

INDEX_FILE=$1
if [ -z $1 ]; then
   INDEX_FILE="./"
fi

### report url
        # /opt/conda/bin/bokeh serve  $INDEX_FILE --prefix ${NB_TESTURL} --allow-websocket-origin '*' --port $REPORT_PORT
        /opt/conda/bin/bokeh serve  $INDEX_FILE --address "wfct0p-dataexpviz-edu" --prefix ${NB_TESTURL} --allow-websocket-origin '*' --port $REPORT_PORT

### latest url
#if [ "$REPORT_TYPE" ]; then
#        /opt/conda/bin/bokeh serve  $INDEX_FILE --prefix /${REPORT_ABS}/report --allow-websocket-origin ##OUTERHOST## --port $NB_PORT
#fi
