#!/bin/bash
#
# Written by multiple1902 <multiple1902@gmail.com>
# Released under MIT License
#
# fetion_myself.sh:
#   Send a feixin (Fetion) message to myself.
#
# Usage:
#   fetion_myself.sh <message>
# 
# Note: 
#   If no message is provided, the FETION_DEFAULT_MESSAGE would be used.
#
# Requirements:
#   cliofetion from AUR
#

FETION_DATAFILE=data/fetion.var

FETION_NUMBER=
FETION_PASSWORD=
FETION_DEFAULT_MESSAGE=

test -r $FETION_DATAFILE && source $FETION_DATAFILE && chmod 600 $FETION_DATAFILE

if [ -z "$FETION_NUMBER" ]; then
    echo "Please specify your login credentials";
    exit 5
fi

if [ -z "$FETION_PASSWORD" ]; then
    echo "Please specify your login credentials";
    exit 5
fi

test "$*" != '' && ( cliofetion -f $FETION_NUMBER -p $FETION_PASSWORD -t $FETION_NUMBER -d "$@"; exit 0)

cliofetion -f $FETION_NUMBER -p $FETION_PASSWORD -t $FETION_NUMBER -d "$FETION_DEFAULT_MESSAGE"
