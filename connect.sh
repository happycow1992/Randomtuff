#!/bin/bash
TMPFILE=$(mktemp)

dialog --menu "Select Server:" 30 30 3 \
    1 CentOS \
    2 vCenter-A \
    3 vCenter-B \
    4 BLR-Brik \
    5 ESX-A-10.36.0.208 \
    6 ESX-B-10.36.0.213 \
    7 ESX-C-10.36.0.212 \
    8 ESX-10.34.4.111 \
    9 ESX-10.34.4.112 \
    10 ESX-10.34.4.113 \
    11 ISO-Share 2>$TMPFILE

RESULT=$(cat $TMPFILE)

case $RESULT in
    1) ssh root@10.36.0.101;;
    2) ssh root@cat-vcenter-a.happycow.local;;
    3) ssh root@cat-vcenter-b.happycow.local;;
    4) ssh rksupport@10.36.0.20;;
    5) ssh root@10.36.0.208;;
    6) ssh root@10.36.0.213;;
    7) ssh root@10.36.0.212;;
    8) ssh root@10.34.4.111;;
    9) ssh root@10.34.4.112;;
    10) ssh root@10.34.4.113;;
    11) ssh root@10.36.0.98;;
    *) echo "Unknown Input";;
esac

rm $TMPFILE
