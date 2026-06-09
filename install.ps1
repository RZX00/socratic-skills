# socratic-coding installer (Windows / PowerShell)
# Usage:  irm https://raw.githubusercontent.com/RZX00/socratic-skills/main/install.ps1 | iex
#Requires -Version 5
$ErrorActionPreference = 'Stop'

$RawUrl = 'https://raw.githubusercontent.com/RZX00/socratic-skills/main/skills/socratic-coding/SKILL.md'
$Targets = @(
    (Join-Path $HOME '.claude\skills\socratic-coding'),  # Claude Code
    (Join-Path $HOME '.agents\skills\socratic-coding')    # Codex
)

Write-Host 'Installing the socratic-coding skill...' -ForegroundColor Cyan
$content = (Invoke-WebRequest -Uri $RawUrl -UseBasicParsing).Content

foreach ($dir in $Targets) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    Set-Content -Path (Join-Path $dir 'SKILL.md') -Value $content -Encoding UTF8
    Write-Host "  installed -> $dir" -ForegroundColor Green
}

Write-Host 'Done. Restart Claude Code / Codex, then the skill auto-activates on vague or plan-mode coding requests.' -ForegroundColor Cyan
