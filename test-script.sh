#!/bin/bash

set -u
set -e

MERGE=${PWD}/merge
LAYER01=${PWD}/layer01
LAYER02=${PWD}/layer02
LAYER03=${PWD}/layer03
LAYER04=${PWD}/layer04

mountpoint ${PWD}/merge >/dev/null 2>&1 && umount ${PWD}/merge

for i in layer0{1..4} merge; do
  rm -rf ${PWD}/${i}
  mkdir -vp ${PWD}/${i}
done

# layer01 / mkdir
mkdir -vp ${LAYER01}/bar

# layer02 / rmdir
mount -t aufs -o br:${LAYER02}=rw:${LAYER01}=ro+wh none ${MERGE}
rm -vrf ${MERGE}/bar
umount ${MERGE}
tree -a ${PWD}/layer* ${MERGE}

# layer03 / mkdir
mount -t aufs -o br:${LAYER03}=rw:${LAYER02}=ro+wh:${LAYER01}=ro+wh none ${MERGE}
mkdir -vp ${MERGE}/bar
umount ${MERGE}
tree -a ${PWD}/layer* ${MERGE}

# layer04 / touch and rmdir
mount -t aufs -o br:${LAYER04}=rw:${LAYER03}=ro+wh:${LAYER02}=ro+wh:${LAYER01}=ro+wh none ${MERGE}
ls -la ${MERGE}
touch ${MERGE}/bar
ls -la ${MERGE}
rm -vrf ${MERGE}/bar
# deleted ${MARGE}/bar. But exists.
ls -la ${MERGE}
exit

# check
umount ${MERGE}
tree -a ${PWD}/layer* ${MERGE}

