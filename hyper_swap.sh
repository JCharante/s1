#!/usr/bin/env bash

echo "Enabling swap on container tagged $coname hosted on hyper.sh"

$hyper exec $coname swapon --show

echo "\$ free -h"
$hyper exec $coname free -h

echo "\$ df -h"
$hyper exec $coname df -h
$hyper exec $coname fallocate -l 1G swapfile

echo "\$ ls -lh swapfile"
$hyper exec $coname ls -lh swapfile
$hyper exec $coname chmod 600 swapfile

echo "\$ ls -lh swapfile"
$hyper exec $coname ls -lh swapfile
$hyper exec $coname mkswap swapfile
# Now restart the container
echo "Restarting $coname"
$hyper restart $coname
# Quick Nap
echo "Sleeping for 15s"
sleep 15
# Back to working on swap
echo "Woke up"
$hyper exec $coname swapon swapfile
$hyper exec $coname swapon --show

echo "\$ free -h"
$hyper exec $coname free -h
$hyper exec $coname cp /etc/fstab /etc/fstab.bak
$hyper exec $coname echo 'swapfile none swap sw 0 0'
$hyper exec $coname tee -a /etc/fstab

echo "\$ free -h"
$hyper exec $coname free -h
# Done!
