#!/bin/bash
echo traceroute ip:$1 from localhost
ip=$1
# echo
#mtr --n --report $ip|grep -v ^HOST|awk '{printf $1" "$2" ";system("whois "$2"|grep descr|head -n1|cut -c17-");printf "\n"}'
mtr --n --report $ip | grep -v ^HOST | awk '{printf $1" "$2" ";system("whois "$2"|grep -e netname -e descr|cut -c17-");printf "\n"}'