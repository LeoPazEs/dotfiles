#!/bin/bash

# Check if bluetui is available
if ! command -v bluetui &> /dev/null; then
    exit 1
fi
echo "bluetui"
exit 0
