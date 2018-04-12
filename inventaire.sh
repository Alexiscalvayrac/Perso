#!/bin/bash
#$(nmap -sP 194.167.36.0/24 > machines_qui_repondent)

#$(sed 2d machines_qui_repondent)
MAC=$(grep MAC machines_qui_repondent | cut -d" " -f3)
taille=$(grep MAC machines_qui_repondent | cut -d" " -f3 | wc | cut -d" " -f5) 

for (( x = 1 ; x <= taille ; x++ ))
	do 
	mac_temp=$(grep MAC machines_qui_repondent | cut -d" " -f3 | sed -n "$x p")
	ip_temp=$(grep 'Nmap scan' machines_qui_repondent | sed 1d | cut -d" " -f6 | sed -n "$x p" | sed "s/(//" | sed "s/)//")
	symbo=$(grep 'Nmap scan' machines_qui_repondent | sed 1d | cut -d" " -f5 | sed -n "$x p")
	if [ -z "$ip_temp" ]
	then 
	ip_temp=$(grep 'Nmap scan' machines_qui_repondent | sed 1d | cut -d" " -f5 | sed -n "$x p")
	symbo=$(dig -x $ip_temp | grep PTR | sed 1d | awk '{print $5}' )
	fi 

	echo "$mac_temp " " $ip_temp" " $symbo"

done 

