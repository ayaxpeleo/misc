#!/bin/bash

while true; do
    uptime >> uptime.log;
    (echo "%CPU %MEM ARGS $(date)" && ps -e -o pcpu,pmem,args --sort=pcpu | cut -d" " -f1-5 | tail) >> ps.log;
    sleep 1;
done
