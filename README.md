# Getting the max out of an s1 container


## Deploying to hyper.sh

If you already have your hyper.sh cli client setup, 
then just edit and paste into a terminal (or manually retype if you're untrusting)

```
export hyper=~/hyper # Location of your hyper executable
export coname=s1-test # Value of your container name
export fip=199.245.57.66 # Value of your fip

hyper rm -f $coname # Remove your currently running container
hyper run -d -p 80:80 --name $coname --restart=always --size=s1 jcharante/s1 # Start up the a new container
hyper fip attach $fip $coname; # Attach the fip to the container
./hyper_swap.sh # Enable Swap
;
```
