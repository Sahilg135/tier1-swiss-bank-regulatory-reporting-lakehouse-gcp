#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="tools/git-snippets.sh"
TODAY="$(date +%F)"                 # e.g., 2025-11-10
EXCLUDE_REGEX='^(git status|git log|git diff)'

# Ensure log file exists.
touch "$LOG_FILE"

# If today's header is not present, add it once.
if ! grep -q "^# ===== ${TODAY} =====" "$LOG_FILE"; then
  printf '\n# ===== %s =====\n' "$TODAY" >> "$LOG_FILE"
fi

# Pull the most up-to-date history from disk into this session.
# - history -a writes new lines from this session to ~/.bash_history
# - history -n reads any lines appended by other sessions
history -a
history -n

# We expect history lines like:
#   2025-11-10 21:04:55 git fetch --all
# Filter:
#   1) keep only lines whose timestamp date == TODAY
#   2) strip the leading timestamp
#   3) keep only commands beginning with "git "
#   4) drop noisy subcommands (status/log/diff) to reduce clutter
#   5) compress consecutive duplicates (awk trick)
history \
  | awk -v today="$TODAY" '
      # Lines look like: " 1234  2025-11-10 21:04:55 git ..."
      # Remove leading entry number if present
      { sub(/^[[:space:]]*[0-9]+[[:space:]]+/, "", $0) }
      # Keep only lines that start with YYYY-MM-DD
      $1 ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ {
        if ($1 == today) {
          # Remove the date and time fields, leaving the command
          $1=""; $2="";
          sub(/^[[:space:]]+/, "", $0)
          print $0
        }
      }
    ' \
  | grep -E '^git ' \
  | grep -Ev "$EXCLUDE_REGEX" \
  | awk 'NR==1{prev=""} { if ($0!=prev) {print; prev=$0} }' \
  >> "$LOG_FILE"

# Optional: echo where we wrote to.
echo "Appended today's git commands to ${LOG_FILE}"
