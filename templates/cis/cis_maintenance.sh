#!/bin/sh
grep=`which grep`
grep ^+: /etc/passwd /etc/shadow /etc/group > /var/log/legacy_entries.log
echo $?
