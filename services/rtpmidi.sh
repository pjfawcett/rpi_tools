#! /bin/bash

cat > /etc/systemd/system/rtpmidi-listen.service <<EOF
[Unit]
Description=RTP Midi Listener
After=network.target
Requires=ttymidi.service

[Service]
Type=exec
ExecStart=/opt/rtpmidi_1.1.2-raspios-2023-10-10-bookworm64/bin/rtpmidi listen -u 5012 -f 128:0 -t 128:1 -B $HOSTNAME -- -GSLogSyslog YES
WorkingDirectory=/home/midi/
StandardOutput=inherit
StandardError=inherit
Restart=always
User=midi

[Install]
WantedBy=multi-user.target

EOF
