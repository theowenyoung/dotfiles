#!/bin/sh

if [ $# -eq 0 ] ; then
    echo 'service name is required!'
    exit 1
fi

UNIT="$1"



systemctl --user enable $UNIT

systemctl --user daemon-reload
systemctl --user restart $UNIT
systemctl --user status $UNIT