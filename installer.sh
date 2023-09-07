#!/bin/bash


mkdir -p /var/lib/node_exporter/textfile_collector/
mkdir -p /usr/lib/ufw_status/

cp ufw_status.sh /usr/lib/ufw_status/
chmod +x /usr/lib/ufw_status/ufw_status.sh


echo '[Unit]
Description=Run ufw_status.sh every 5 seconds

[Service]
ExecStart=/usr/lib/ufw_status/ufw_status.sh

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/ufw_status.service

echo '[Unit]
Description=Run ufw_status.service every 5 seconds

[Timer]
OnBootSec=5s
OnUnitActiveSec=5s

[Install]
WantedBy=timers.target; > /etc/systemd/system/ufw_status.timer




sudo systemctl daemon-reload

sudo systemctl enable ufw_status.service
sudo systemctl enable ufw_status.timer

sudo systemctl start ufw_status.service
sudo systemctl start ufw_status.timer

sudo systemctl status ufw_status.service
sudo systemctl status ufw_status.timer



