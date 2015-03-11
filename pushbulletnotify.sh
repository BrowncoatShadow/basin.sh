#!/bin/bash
# Pushbullet notification module for twitcheck by Browncoatshadow

source 'settings.sh'

# Check if a target is defined.
if [ -n "$PB_TARGET" ]
	then
		# Push to target device.
		curl --header 'Authorization: Bearer '$PB_TOKEN'' -X POST https://api.pushbullet.com/v2/pushes --header 'Content-Type: application/json' --data-binary '{"device_iden": "'"$PB_TOKEN"'", "type": "link", "title": "'"$1"' is streaming '"$2"'", "body": "'"$3"'", "url": "'"$4"'"}'
	else
		# Push to all devices, if no target.
		curl --header 'Authorization: Bearer '$PB_TOKEN'' -X POST https://api.pushbullet.com/v2/pushes --header 'Content-Type: application/json' --data-binary '{"type": "link", "title": "'"$1"' is streaming '"$2"'", "body": "'"$3"'", "url": "'"$4"'"}'
