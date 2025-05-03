#!/bin/bash
# Backup original SSH config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Harden SSH config
cat <<EOF >> /etc/ssh/sshd_config
Port 2222
PermitRootLogin no
PasswordAuthentication no
LoginGraceTime 30
MaxAuthTries 3
EOF

# Restart SSH
systemctl restart sshd
