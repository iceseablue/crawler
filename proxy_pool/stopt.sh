#!/bin/sh

pid=`/bin/pidof  ./ssdb-server ssdb.conf`
echo "pid:", $pid
if [ ! -n $1 ]then
 echo -e "Please input userpassword\r"
else
 passwd=$1"\r"
fi
echo $passwd | sudo -S kill -9 $pid
sleep 2
pidof python ProxyValidSchedule.py | xargs kill -9
pidof python main.py | xargs kill -9
