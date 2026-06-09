#!/usr/bin/env bash
# socratic-coding installer (macOS / Linux)
# Usage:  curl -fsSL https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.sh | bash
set -euo pipefail

RAW_URL="https://raw.githubusercontent.com/RZX00/socratic-skills/main/skills/socratic-coding/SKILL.md"
TARGETS=(
  "$HOME/.claude/skills/socratic-coding"   # Claude Code
  "$HOME/.agents/skills/socratic-coding"   # Codex
)

echo "Installing the socratic-coding skill..."
content="$(curl -fsSL "$RAW_URL")"

for dir in "${TARGETS[@]}"; do
  mkdir -p "$dir"
  printf '%s' "$content" > "$dir/SKILL.md"
  echo "  installed -> $dir"
done

echo "Done. Restart Claude Code / Codex, then the skill auto-activates on vague or plan-mode coding requests."
