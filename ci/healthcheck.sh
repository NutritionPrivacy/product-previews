#!/bin/bash
# healthcheck.sh

max_retries=30
count=0

echo "Waiting for service to be up..."

while ! curl -f http://0.0.0.0:8080
do
    count=$((count + 1))
    if [ $count -ge $max_retries ]; then
        echo "Service did not become available in time."
        exit 1
    fi
    sleep 5
done

echo "Service is up and running."

