#!/bin/bash
# Set password policy in /etc/login.defs
sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/' /etc/login.defs
sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   7/' /etc/login.defs
sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE   7/' /etc/login.defs

# Install libpam-pwquality if not already installed
if ! dpkg -l | grep -q libpam-pwquality; then
    apt install libpam-pwquality -y
fi

# Configure /etc/security/pwquality.conf
cat <<EOF > /etc/security/pwquality.conf
minlen = 12
dcredit = -1
ucredit = -1
ocredit = -1
lcredit = -1
EOF
