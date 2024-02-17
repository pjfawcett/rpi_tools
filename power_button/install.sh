#! /bin/bash

SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"

cp $SCRIPT_DIR/power_button.py /usr/local/bin

cp $SCRIPT_DIR/power_button.service /etc/systemd/system

systemctl daemon-reload
