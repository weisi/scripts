#!/bin/bash
#
# Written by multiple1902 <multiple1902@gmail.com>
# Released under MIT License
#
# fetion:
#   Send a feixin (Fetion) message.
#
# Usage:
#   fetion.sh <receiver> <message>
# 
# If no message is provided, the FETION_DEFAULT_MESSAGE would be used.
#
# Requirements:
#   cliofetion from AUR
#

FETION_DATAFILE=data/fetion.var

FETION_NUMBER=
FETION_PASSWORD=

test -r $FETION_DATAFILE && source $FETION_DATAFILE && chmod 600 $FETION_DATAFILE

if [ -z "$FETION_NUMBER" ]; then
    echo "Please specify your login credentials";
    exit 5
fi

if [ -z "$FETION_PASSWORD" ]; then
    echo "Please specify your login credentials";
    exit 5
fi

if [ -z "$1" ]; then
    echo "Please specify the receiver"; 
    exit 1;
fi

FETION_RECEIVER=$1
shift

if [ -z "$*" ]; then
    echo "Please specify the message";
    exit 2;
fi

cliofetion -f $FETION_NUMBER -p $FETION_PASSWORD -t $FETION_RECEIVER -d "$*"
