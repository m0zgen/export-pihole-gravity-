#!/bin/bash
# Export AD list, WHITE list, BLACK list from Pi-Hole Gravity
# Created by Y.G., https://sys-adm.in

# Envs
# ---------------------------------------------------\
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)


GRDB='/etc/pihole/gravity.db'
DEST=${SCRIPT_PATH}/backup

cd $SCRIPT_PATH

if [[ ! -d '$DEST' ]]; then
	mkdir -p $DEST
fi

sqlite3 $GRDB -header -csv 'select * from adlist' > $DEST/adlist.csv
sqlite3 $GRDB -header -csv 'select * from vw_whitelist' > $DEST/whitelist.csv
sqlite3 $GRDB -header -csv 'select * from vw_blacklist' > $DEST/blacklist.csv

ls $DEST
echo -e 'Done!'