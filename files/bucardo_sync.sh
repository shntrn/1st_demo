#!/bin/bash

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$PATH:/usr/local/bin

node1=$1
node2=$2

dbname=$3

dbuser=$4
dbpass=$5


$echo "Adding adding tables and sequences"
bucardo add table all --db=source_db1 --herd=app_db_herd
bucardo add sequence all --db=source_db1 --herd=app_db_herd

$echo "Adding db group"
bucardo add dbgroup app_dbs_group

$echo "Adding db source"
bucardo add dbgroup app_dbs_group source_db1:source
bucardo add dbgroup app_dbs_group source_db2:source

$echo "Adding sync"
bucardo add sync app_dbs_sync herd=app_db_herd dbs=app_dbs_group

bucardo restart