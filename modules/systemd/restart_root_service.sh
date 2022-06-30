#!/bin/sh

if [[ $# -eq 0 ]] ; then
    echo 'service name is required!'
    exit 1
fi

UNIT=$1



systemctl enable $UNIT

systemctl daemon-reload
systemctl restart $UNIT
systemctl status $UNIT
