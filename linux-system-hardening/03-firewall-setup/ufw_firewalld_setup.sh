#!/bin/bash
if command -v ufw &>/dev/null; then
    ufw enable
    ufw default deny incoming
    ufw default allow outgoing
    ufw allow 2222/tcp
elif command -v firewall-cmd &>/dev/null; then
    firewall-cmd --permanent --add-port=2222/tcp
    firewall-cmd --reload
fi
