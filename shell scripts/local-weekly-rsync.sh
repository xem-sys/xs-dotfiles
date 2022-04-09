#!/usr/bin/env bash
# local-weekly-rsync.sh
#current date and time to be used as filename
CDT=`date +%d-%b-%Y-%H-%M`
LDIR='/root/scripts/logs/'

echo "[START]  $(date)" >> ${LDIR}weekly-local-${CDT}.log
rsync -aAX / --exclude={"/boot/*","/dev/*","/proc/*","/sys/*","/home/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /media/bak/weekly --log-file=${LDIR}weekly-local-${CDT}.log
echo "[END]  $(date)" >> ${LDIR}weekly-local-${CDT}.log
