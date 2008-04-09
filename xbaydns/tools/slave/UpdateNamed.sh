#!/bin/sh

PPATH=`dirname $0`
if [ -f "$PPATH/agent.conf" ]; then
	. $PPATH/agent.conf
	. /home/xdslave/xdenv
fi

cd $PPATH
rsync -avz -e 'ssh -i /home/xdslave/rsync-key' \
 xbaydns\@$MASTER_IP:/home/xbaydns/slave/named/etc/acl /home/xdslave/named/etc/

rsync -avz -e 'ssh -i /home/xdslave/rsync-key' \
 xbaydns\@$MASTER_IP:/home/xbaydns/slave/named/etc/view /home/xdslave/named/etc/

rsync -avz -e 'ssh -i /home/xdslave/rsync-key' \
 xbaydns\@$MASTER_IP:/home/xbaydns/slave/named/etc/dynamic /home/xdslave/named/etc/
