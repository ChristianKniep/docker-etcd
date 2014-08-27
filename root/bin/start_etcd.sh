#!/bin/bash

BINARY=/usr/bin/etcd
trap stop SIGTERM

function wait_proc {
    if [ $(ps -ef|grep -v grep|grep -c ${BINARY}) -ne 0 ];then
        sleep 1
        wait_proc
    fi
}

cd /var/lib/etcd/
/usr/bin/etcd -c HOSTNAME:4001 -s HOSTNAME:7001 &
MYPID=$(ps -ef|grep -v grep |grep ${BINARY}|awk '{print $2}')

function stop () {
  kill -9 ${MYPID}
}

wait_proc
