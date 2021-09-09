#!/bin/sh
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# while true; do
#     # Log stderror to a file 
#     dwm 2> ~/.dwm.log
#     # No error logging
#     #dwm >/dev/null 2>&1
# done
# exec dwm
while :; do
	ssh-agent dwm
done
ssh-agent dwm
