#!/bin/bash

DIR='/home/ubuntu/icap/input/'
ODIR='/home/ubuntu/icap/output'
rm -rf ${ODIR} > /dev/null 2>&1
mkdir -p ${ODIR}
for file in "$DIR"*.*
do
    filename=${file##*/}
	   /usr/bin/c-icap-client -i gw-icap01.westeurope.azurecontainer.io -p 1344 -s gw_rebuild -f "$file" -o "$ODIR"/"$filename" -v
done