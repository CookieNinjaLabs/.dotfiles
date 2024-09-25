#!/bin/bash
# Delete swap files older than 24 hours
find /home/kamil/.local/state/nvim/swap/ -type f -name '*.swp' -mtime +1 -delete
