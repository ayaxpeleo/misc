#!/bin/bash

#
# log the information for the cpu load in the system:
#
# ps.log
#
# %CPU %MEM ARGS Tue Jun 19 17:31:59 UTC 2018
# 0.0  0.0 pickup
# 0.0  0.0 /bin/bash
# 0.0  0.0 sleep
# 0.0  0.0 /bin/bash
# 0.0  0.0 ps
# 0.0  0.0 cut
# 0.0  0.0 tail
# 0.2  0.1 /srv/nsq/nsq-0.3.8/nsq-0.3.8.linux-amd64.go1.6.2/bin/nsqd
# 0.4  0.3 /usr/sbin/envoy
# 0.8  1.2 python
#
#
# uptime.log
#
# 08:50:08 up 21 min,  0 users,  load average: 0.49, 0.35, 0.19
# 08:50:09 up 21 min,  0 users,  load average: 0.49, 0.35, 0.19
# 08:50:10 up 21 min,  0 users,  load average: 0.49, 0.35, 0.19
# 08:50:11 up 21 min,  0 users,  load average: 0.45, 0.34, 0.19
# 08:50:12 up 21 min,  0 users,  load average: 0.45, 0.34, 0.19
# 08:50:13 up 21 min,  0 users,  load average: 0.45, 0.34, 0.19
# 08:50:14 up 21 min,  0 users,  load average: 0.45, 0.34, 0.19
#
# based on https://askubuntu.com/questions/22021/how-to-log-cpu-load
#
while true; do
    uptime >> uptime.log;
    (echo "%CPU %MEM ARGS $(date)" && ps -e -o pcpu,pmem,args --sort=pcpu | cut -d" " -f1-5 | tail) >> ps.log;
    top -b -n 2 -d 1 >> top.log
    sleep 58;
done
