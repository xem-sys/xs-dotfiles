#!/bin/bash
# ext-weekly-rsync.sh
#current date and time to be used as filename
CDT=`date +%d-%b-%Y-%H-%M`
LDIR='/root/scripts/logs/'

echo "[START]  $(date)" >> ${LDIR}weekly-ext-${CDT}.log
rsync -aAX /media/bak/ /media/external/Archive/Bak/ --log-file=${LDIR}weekly-ext-${CDT}.log
echo "[END]  $(date)" >> ${LDIR}weekly-ext-${CDT}.log
