#!/bin/bash
instance=readsb-pf
systemctl stop ${instance}
#rm -rf /run/${instance}
mkdir -p /run/${instance}
chown readsb-pf /run/${instance}
source /etc/default/${instance}

runuser -u readsb-pf -- gdb -batch -ex 'set confirm off' -ex 'handle SIGTERM nostop print pass' -ex 'handle SIGINT nostop print pass' -ex run -ex 'bt full' --args /usr/bin/readsb-pf --quiet $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS --write-json /run/${instance} $@
#/usr/bin/sudo -u readsb-pf /usr/bin/readsb-pf --quiet $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS --write-json /run/${instance} $@

