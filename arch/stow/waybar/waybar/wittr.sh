#!/usr/bin/env bash

LOCATION="Benicia"

DATA=$(curl -sf "https://wttr.in/${LOCATION}?format=j1")
TEMP=$(echo "$DATA" | jq -r '.current_condition[0].temp_F')
DESC=$(echo "$DATA" | jq -r '.current_condition[0].weatherDesc[0].value')
CODE=$(echo "$DATA" | jq -r '.current_condition[0].weatherCode')

case $CODE in
  113) ICON="☀️" ;;
  116) ICON="⛅" ;;
  119|122) ICON="☁️" ;;
  176|185|263|266|281|284|293|296|299|302|305|308|311|314|317|320|323|326|329) ICON="🌧️" ;;
  200|386|389|392|395) ICON="⛈️" ;;
  338|335|332|329|326|323|320|317|314|227|230) ICON="❄️" ;;
  *) ICON="🌡️" ;;
esac

echo "{\"text\": \"<span size='large'>$ICON</span> $TEMP°F\", \"tooltip\": \"$DESC\"}"

