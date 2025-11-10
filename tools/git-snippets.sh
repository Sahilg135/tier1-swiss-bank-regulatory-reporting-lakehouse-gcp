# Git command snippets — append-only log
# Auto-managed by tools/log_git_today.sh

# ===== 2025-11-10 — Study Files Setup =====
mkdir -p docs tools
mv ~/Downloads/git-commands-cheatsheet.md ./docs/
mv ~/Downloads/git-snippets.sh ./tools/
git add docs/git-commands-cheatsheet.md tools/git-snippets.sh
git commit -m "docs: add Git study cheatsheet and snippets tracker"
git push

# ===== 2025-11-10 — Weekly Maintenance =====
git pull --ff-only
echo "# $(date '+%Y-%m-%d %H:%M') — git fetch --all --prune" >> tools/git-snippets.sh
git add docs/git-commands-cheatsheet.md tools/git-snippets.sh
git commit -m "docs: weekly update of Git logs and command notes"
git push

# ===== 2025-11-11 =====
# (auto-appended entries for this date will appear below)
# (fallback appended from recent session — timestamps were not yet enabled)
# (fallback appended from recent session — timestamps were not yet enabled)
