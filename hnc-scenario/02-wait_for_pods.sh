#!/bin/bash

counter=0
status=1
while [ $status == 1 ] && [ $counter -lt 60 ]
do
    kubectl rollout status deployment -n hnc-system hnc-controller-manager --timeout=10s > /dev/null 2>&1
    status=$?
    counter=$((counter+1))
    echo "Waiting for HNC to be running..."
    sleep 3
done

echo "HNC is running!"