#!/bin/bash

# Default Gotify URL from environment variable
GOTIFY_URL="${GOTIFY_URL}"

# Default title to system hostname
DEFAULT_TITLE=$(hostname)
TITLE="$DEFAULT_TITLE"

# Parse arguments for --title option
while [[ "$1" == --* ]]; do
    case "$1" in
        --title=*)
            TITLE="${1#*=}"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: gotify.sh [--title=Custom Title] \"Your message here\" or echo \"Your message\" | gotify.sh"
            exit 1
            ;;
    esac
done

# Ensure the message argument or stdin input is provided
if [ -z "$1" ] && [ -t 0 ]; then
    echo "Usage: gotify.sh [--title=Custom Title] \"Your message here\" or echo \"Your message\" | gotify.sh"
    exit 1
fi

# Read from stdin if no argument is provided
if [ -z "$1" ]; then
    MESSAGE=$(cat)
else
    MESSAGE="$1"
fi

# Ensure Gotify URL is set
if [ -z "$GOTIFY_URL" ]; then
    echo "Error: GOTIFY_URL is not set. Please configure it in your environment."
    exit 1
fi

# Send the message to Gotify
curl -s -X POST "$GOTIFY_URL" \
    -F "title=$TITLE" \
    -F "message=$MESSAGE" || echo "Error: Failed to send message to Gotify"
