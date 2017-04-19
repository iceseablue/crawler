#!/bin/sh

cur_path=`pwd`
echo $cur_path
cd /usr/local/ssdb/
echo "start running ssdb....."
if [ ! -n $1 ]
then
 echo -e "Please input userpassword\r"
else 
 passwd=$1"\r"
fi

echo $passwd | sudo -S ./ssdb-server ssdb.conf >${cur_path}/log/running.log 2>&1 &
sleep 2
cd -
cd Schedule/
python ProxyRefreshSchedule.py >../log/refresh.log 2>&1 &
cd -
cd Run/
python main.py >../log/main.log 2>&1 &

cd -

echo "Runing ..."


