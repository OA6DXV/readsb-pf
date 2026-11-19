#!/bin/bash
systemctl stop test
rm -rf /run/readsb-pf-test
mkdir -p /run/readsb-pf-test
chown readsb-pf /run/readsb-pf-test
source /etc/default/test
cp -f readsb-pf /tmp/readsb-pf-test

#gdb -ex=run --args /tmp/readsb-pf-test --quiet $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS $@
gdb -batch -ex 'set confirm off' -ex 'handle SIGTERM nostop print pass' -ex 'handle SIGINT nostop print pass' -ex run -ex 'bt full' --args \
/tmp/readsb-pf-test --quiet $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS $@
#sudo -u readsb-pf ./readsb-pf --quiet $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS --net-connector 127.0.0.1,50006,beast_in $@

