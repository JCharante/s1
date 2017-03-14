# Getting the max out of an s1 container


## Deploying to hyper.sh
```
# Set the value of your container name
coname=s1
# Set the value of your fip
fip=199.245.57.66

# Stop your currently running container
hyper stop $coname
hyper rm $coname
# Start up the a new container
hyper run -d -p 80:80 --name $coname --restart=always --size=s1 jcharante/s1
# Attach the fip to the container
hyper fip attach $fip $coname;
# Enable swap on the container
hyper exec $coname swapon --show
hyper exec $coname free -h
hyper exec $coname df -h
hyper exec $coname fallocate -l 1G swapfile
hyper exec $coname ls -lh swapfile
hyper exec $coname chmod 600 swapfile
hyper exec $coname ls -lh swapfile
hyper exec $coname mkswap swapfile
# Now restart the container
hyper restart $coname
# Quick Nap
sleep 15
# Back to working on swap
hyper exec $coname swapon swapfile
#hyper restart $coname
#sleep 15
hyper exec $coname swapon --show
hyper exec $coname free -h
hyper exec $coname cp /etc/fstab /etc/fstab.bak
hyper exec $coname echo 'swapfile none swap sw 0 0'
hyper exec $coname tee -a /etc/fstab
hyper exec $coname free -h
# Done!

```