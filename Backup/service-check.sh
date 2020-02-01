#!/bin/sh
echo -e "---------------------------------Check Start----------------------------------" 
echo -e "当前进程状态：" 
num=`ps | grep sshd | egrep -v 'grep|check' | wc -l`
if [ $num -lt 1 ]
then 
      echo -e "sshd status：Not OK" 
      /opt/sbin/sshd
      sleep 5
      num1=`ps | grep sshd | egrep -v 'grep|check' | wc -l` 
      if [ $num1 -eq 1 ]
      then
           echo -e "sshd restart：OK"  
           ps | grep xunlei | egrep -v 'grep|check' 
      else 
           echo -e "sshd restart：Not OK"  
           echo -e "wait for next restart"  
      fi           
else 
      echo -e "sshd status：OK" 
fi
echo -e "---------------------------------Check Over------------------------------------" 
