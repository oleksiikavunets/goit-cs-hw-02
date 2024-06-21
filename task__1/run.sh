#!/usr/bin/env bash

#set -x
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

for website in "${websites[@]}"; do
  code=$(curl -o /dev/null -s -L --request GET "$website" -w "%{http_code}\\n")

  if [ "$code" -lt 500 ]; then
    echo "<$website>" is UP >>website_status.log
  else
    echo "<$website>" is DOWN >>website_status.log
  fi
done
