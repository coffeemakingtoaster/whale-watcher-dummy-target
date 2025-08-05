#!/bin/bash

echo "(Re-)Installing whale-watcher"
rm ./whale-watcher
curl -LO --silent https://github.com/coffeemakingtoaster/whale-watcher/releases/download/pre-release/whale-watcher && chmod +x ./whale-watcher

FILE_TO_WATCH="./prod.Dockerfile"

echo "Watching $FILE_TO_WATCH for changes..."

fswatch -o "$FILE_TO_WATCH" | while read; do
    # Optional: add a small delay to ensure the file has been fully written
    sleep 0.2

    # Check if the file has been modified since the last run
    CURRENT_MODTIME=$(stat -c %Y "$FILE_TO_WATCH") # Linux
    # CURRENT_MODTIME=$(stat -f %m "$FILE_TO_WATCH") # macOS, use this line instead

    if [[ "$CURRENT_MODTIME" != "$LAST_MODTIME" ]]; then
    	WHALE_WATCHER_CONFIG_PATH=./whale_watcher_config.yaml ./whale-watcher validate ./ruleset.yaml
        LAST_MODTIME=$CURRENT_MODTIME
    fi
done
