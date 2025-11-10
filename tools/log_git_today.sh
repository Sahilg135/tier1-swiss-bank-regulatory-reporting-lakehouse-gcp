#!/usr/bin/env bash
set -euo pipefail

# ---------------------------------------------------------------------
# Git Daily Command Collector — Maintains tools/git-snippets.sh
# Logs all git commands run between 00:00–23:59 of the same day.
# ---------------------------------------------------------------------

LOG_FILE="tools/git-snippets.sh"
TODAY="$(date +%F)"                             # e.g., 2025-11-11
EXCLUDE_REGEX='^(git status|git log|git diff)'

# Ensure log file exists
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

# Add today's header once if missing
if ! grep -q "^# ===== ${TODAY} =====" "$LOG_FILE"; then
  printf '\n# ===== %s =====\n' "$TODAY" >> "$LOG_FILE"
fi

# Persist in-memory history and reload from file
history -a        # append current session to ~/.bash_history
history -n        # read new lines appended by other sessions

# Append today's git commands
history \
  | awk -v today="$TODAY" '
      {
        sub(/^[[:space:]]*[0-9]+[[:space:]]+/, "", $0)
        if ($1 == today) {
          $1=""; $2="";
          sub(/^[[:space:]]+/, "", $0)
          print $0
        }
      }' \
  | grep -E '^git ' \
  | grep -Ev "$EXCLUDE_REGEX" \
  | awk 'NR==1{prev=""} { if ($0!=prev) {print; prev=$0} }' \
  >> "$LOG_FILE"

echo "✅ Appended today's git commands to ${LOG_FILE}"
