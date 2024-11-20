#!/bin/bash

log_file="website_status.log"
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://x.com"
)

echo "Checking website availability..."

for website in "${websites[@]}"; do
    http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
    
    if [[ $http_status -eq 200 ]]; then
        echo "$website is UP" 
        echo "$website is UP" >> "$log_file"
    else
        echo "$website is DOWN"
        echo "$website is DOWN" >> "$log_file"
    fi
done

echo "Results have been logged to $log_file."