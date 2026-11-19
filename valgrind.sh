#!/bin/bash
systemctl stop test
rm -rf /run/readsb-pf-test
mkdir -p /run/readsb-pf-test
chown readsb-pf /run/readsb-pf-test
source /etc/default/test
cp -f readsb-pf /tmp/readsb-pf-test

FIRST="--error-exitcode=3 --exit-on-first-error=yes"
FIRST="-s"

MEM="--track-origins=yes"
MEM="--show-leak-kinds=all --leak-check=full"
MEM="--show-leak-kinds=all --track-origins=yes --leak-check=full"
MEM=""

valgrind $MASSIF $FIRST $MEM /tmp/readsb-pf-test $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS --quiet --db-file=none $@

