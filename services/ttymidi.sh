#! /bin/bash

cat > /etc/systemd/system/ttymidi.service <<EOF
[Unit]
Description=Midi <-> Serial 

[Service]
Type=exec
ExecStart=/home/midi/ttymidi/ttymidi

[Install]
WantedBy=multi-user.target

EOF
