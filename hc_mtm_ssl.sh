#!/bin/sh

# Name of the pidfile
pidfile="/usr/bin/monitors/hc_mtm/hc_mtm_ssl.$1.$2.pid"

# Send signal to the process group to kill our former self and any children 
# as external monitors are run with SIGHUP blocked
if [ -f $pidfile ]
then
   kill -9 -`cat $pidfile` > /dev/null 2>&1
fi
echo "$$" > $pidfile

# Remove the IPv6/IPv4 compatibility prefix 
DB_HOST=$(echo $1 | sed 's/::ffff://')
DB_PORT=$2
OUTPUT="/usr/bin/monitors/hc_mtm/hc_mtm_ssl.$1.$2.log"

# Command check 
cd /opt/centos7_v2
./com.vtb.job.sunshineentryjob $DB_HOST $DB_PORT 2 > "$OUTPUT" 2>&1

# If success 
if grep -q "SUCCESS" "$OUTPUT"; then
    echo "UP"
fi
