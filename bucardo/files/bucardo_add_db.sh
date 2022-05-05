#!/bin/bash

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$PATH:/usr/local/bin

node1=$1
node2=$2

dbname=$3
dbuser=$4
dbpass=$5

$echo "Adding databases"
bucardo add db source_db1 host=$node1 dbname=$dbname dbuser=$dbuser dbpass=$dbpass
bucardo add db source_db2 host=$node2 dbname=$dbname dbuser=$dbuser dbpass=$dbpass

