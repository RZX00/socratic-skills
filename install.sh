#!/usr/bin/env bash
# socratic-thinking installer (macOS / Linux)
# Usage:  curl -fsSL https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.sh | bash
set -euo pipefail

RAW_URL="https://raw.githubusercontent.com/RZX00/socratic-skills/main/skills/socratic-thinking/SKILL.md"
TARGETS=(
  "$HOME/.claude/skills/socratic-thinking"   # Claude Code
  "$HOME/.agents/skills/socratic-thinking"   # Codex
)

echo "Installing the socratic-thinking skill..."
content="$(curl -fsSL "$RAW_URL")"
metadata="$(curl -fsSL "${RAW_URL%/SKILL.md}/agents/openai.yaml")"

for dir in "${TARGETS[@]}"; do
  mkdir -p "$dir/agents"
  printf '%s' "$content" > "$dir/SKILL.md"
  printf '%s' "$metadata" > "$dir/agents/openai.yaml"
  echo "  installed -> $dir"
done

echo "Done. Restart Claude Code / Codex, then invoke socratic-thinking or ask to think through an open question."

echo "Upgrading? Back up custom edits and remove the old socratic-coding skill separately."
