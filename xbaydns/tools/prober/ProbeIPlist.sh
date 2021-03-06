#!/bin/sh


export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin

PPATH=`dirname $0`
#HOST_IP=`ifconfig | grep inet | head -n1 | sed -e 's/:/ /' | awk '{print $3}'`
AGENT_NAME=`cat $PPATH/../myname`
if [ -f "$PPATH/../agent.conf" ]; then
	. $PPATH/../agent.conf
fi

cd ${PPATH}
../../../bin/python2.5 iplatency.py ../iplist ../iplatency/${AGENT_NAME}-`date "+%Y-%m-%d"`
