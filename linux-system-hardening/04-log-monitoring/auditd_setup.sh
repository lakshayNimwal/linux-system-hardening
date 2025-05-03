#!/bin/bash
apt install auditd audispd-plugins -y
systemctl enable auditd
systemctl start auditd

# Watch for passwd changes
auditctl -w /etc/passwd -p wa -k passwd_changes
auditctl -w /etc/shadow -p wa -k shadow_changes
