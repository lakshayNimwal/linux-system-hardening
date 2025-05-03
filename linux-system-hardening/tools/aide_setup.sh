#!/bin/bash
apt install aide -y
aideinit
cp /var/lib/aide/aide.db.new /var/lib/aide/aide.db
