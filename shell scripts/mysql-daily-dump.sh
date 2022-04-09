#!/usr/bin/env bash
# daily mysql backup
#current date and time to be used as filename
CDT=`date +%a-%d-%b-%R`
LDIR='/root/scripts/logs/'
HSTN='NAME'

echo "[START]  $(date)" >> ${LDIR}daily-mysql-${CDT}.log
mysqldump -v --opt --system=all --insert-ignore --all-databases > /dev/null 2> ${LDIR}daily-mysql-${CDT}.log > /media/bak/daily/sql/${HSTN}-${CDT}.sql
echo "[END]  $(date)" >> ${LDIR}daily-mysql-${CDT}.log
