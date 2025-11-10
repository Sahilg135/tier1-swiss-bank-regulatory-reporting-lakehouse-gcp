#!/usr/bin/env bash
set -Eeuo pipefail
# --------------------------------------------------------------
# Git Daily Command Collector (Git Bash–safe)
# Appends *today's* git commands (00:00–23:59 local) from
# ~/.bash_history into tools/git-snippets.sh (next to this script).
# --------------------------------------------------------------

# Resolve paths relative to this script so you can run from anywhere
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LOG_FILE="${SCRIPT_DIR}/git-snippets.sh"

TODAY="$(date +%F)"   # e.g., 2025-11-11
# Skip noisy commands; extend if you want
EXCLUDE_REGEX='^(git status|git diff|git log)$'

mkdir -p "${SCRIPT_DIR}"
: > /dev/null  # no-op
touch "${LOG_FILE}"

# Ensure today's header is present exactly once
if ! grep -q "^# ===== ${TODAY} =====" "${LOG_FILE}"; then
  printf '\n# ===== %s =====\n' "${TODAY}" >> "${LOG_FILE}"
fi

# Parse ~/.bash_history which stores timestamps on lines like:  "# 1731298200"
# followed by the actual command on the next line.
# Use gawk's strftime() to compare dates, then keep only git commands for today.
# Also de-duplicate consecutive identical lines.
awk -v today="${TODAY}" -v exclude="${EXCLUDE_REGEX}" '
  BEGIN { prev="" }
  /^# [0-9]+$/ { ts = substr($0,3); next }
  {
    if (ts != "") {
      d = strftime("%Y-%m-%d", ts)
      cmd = $0
      if (d == today && cmd ~ /^git / && cmd !~ exclude) {
        if (cmd != prev) { print cmd; prev = cmd }
      }
      ts = ""
    }
  }
' "${HOME}/.bash_history" >> "${LOG_FILE}"

# Optional: quick report of today’s total lines now present
today_count="$(awk -v t="${TODAY}" 'f{c++} /^# ===== /{f=($0 ~ t)} END{print c+0}' "${LOG_FILE}")"
printf 'Appended git commands for %s → %s (today total: %s)\n' "${TODAY}" "${LOG_FILE}" "${today_count}"
